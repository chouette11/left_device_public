import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:left_device/page/component/connect_button.dart';
import 'package:left_device/page/root/children/bluetooth/extra.dart';
import 'package:left_device/page/root/children/bluetooth/scan_result_tile.dart';
import 'package:left_device/page/root/children/bluetooth/system_device_tile.dart';
import 'package:left_device/page/snack.dart';
import 'package:left_device/provider/presentation_providers.dart';
import 'package:left_device/repository/ip_address_repository.dart';
import 'package:left_device/util/constant/text_style_constant.dart';
import 'package:left_device/util/send_data.dart';

class BluetoothConnectWidget extends ConsumerStatefulWidget {
  const BluetoothConnectWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<BluetoothConnectWidget> createState() =>
      _BluetoothConnectWidgetState();
}

class _BluetoothConnectWidgetState
    extends ConsumerState<BluetoothConnectWidget> {
  List<BluetoothDevice> _systemDevices = [];
  List<ScanResult> _scanResults = [];
  bool _isScanning = false;
  BluetoothAdapterState _adapterState = BluetoothAdapterState.unknown;
  late StreamSubscription<BluetoothAdapterState> _adapterStateStateSubscription;
  late StreamSubscription<bool> _isScanningSubscription;
  late StreamSubscription<List<ScanResult>> _scanResultsSubscription;

  @override
  void initState() {
    Future(() async {
      final withServices = [Guid("180f")]; // Battery Level Service
      _systemDevices = await FlutterBluePlus.systemDevices(withServices);

      FlutterBluePlus.startScan(timeout: const Duration(seconds: 15));
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
    _adapterStateStateSubscription =
        FlutterBluePlus.adapterState.listen((state) {
      _adapterState = state;
      if (mounted) {
        setState(() {});
      }
    });

    _scanResultsSubscription = FlutterBluePlus.scanResults.listen((results) {
      _scanResults = results;
      if (mounted) {
        setState(() {});
      }
    });

    _isScanningSubscription = FlutterBluePlus.isScanning.listen((state) {
      _isScanning = state;
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _isScanningSubscription.cancel();
    _scanResultsSubscription.cancel();
    _adapterStateStateSubscription.cancel();
    super.dispose();
  }

  Future onScanPressed() async {
    final withServices = [Guid("180f")]; // Battery Level Service
    _systemDevices = await FlutterBluePlus.systemDevices(withServices);
    await FlutterBluePlus.startScan(timeout: const Duration(seconds: 15));

    if (mounted) {
      setState(() {});
    }
  }

  Future onConnectPressed(BluetoothDevice device) async {
    device.connectAndUpdateStream();

    if (_adapterState == BluetoothAdapterState.off) {
      AppSnackBar.of(messager: ScaffoldMessenger.of(context))
          .show('Bluetoothをオンにしてください', SnackBarStatus.info);
      return;
    }

    if (ref.read(selectedTemplateProvider) == null) {
      AppSnackBar.of(messager: ScaffoldMessenger.of(context))
          .show('テンプレートを選択してください', SnackBarStatus.info);
      return;
    }

    bool isTimeOut = false;
    await device.connect().timeout(const Duration(seconds: 3), onTimeout: () {
      isTimeOut = true;
    });

    if (isTimeOut) {
      AppSnackBar.of(messager: ScaffoldMessenger.of(context))
          .show('PCとBluetoothが繋がっていません', SnackBarStatus.info);
      return;
    }
    final services = await device.discoverServices();

    if (!services
        .map((e) => e.uuid.str.toLowerCase())
        .toList()
        .contains('BDFA3AEB-13E6-4C45-881E-83B108C913C1'.toLowerCase())) {
      AppSnackBar.of(messager: ScaffoldMessenger.of(context)).show(
          'PCとBluetoothが繋がっていない、もしくはPCの「スマホで左手デバイス」が起動していません',
          SnackBarStatus.info);
      return;
    }

    context.pushReplacement('/bluetooth_keypad', extra: device);
  }

  Future onRefresh() {
    if (_isScanning == false) {
      FlutterBluePlus.startScan(timeout: const Duration(seconds: 15));
    }
    if (mounted) {
      setState(() {});
    }
    return Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _adapterState == BluetoothAdapterState.off
            ? Text(
                'Bluetoothをオンにしてください',
                style:
                    TextStyleConstant.bold16.copyWith(color: Colors.redAccent),
              )
            : const SizedBox.shrink(),
        ElevatedButton(
          onPressed: () async {
            await onScanPressed();
          },
          child: const Text('スキャン'),
        ),
        Expanded(
          child: ListView(
            children: _systemDevices.isNotEmpty
                ? _systemDevices
                    .map(
                      (d) => SystemDeviceTile(
                        device: d,
                        onOpen: () async {
                          await onConnectPressed(d);
                        },
                        onConnect: () async {
                          await onConnectPressed(d);
                        },
                      ),
                    )
                    .toList()
                : _scanResults
                    .map(
                      (r) => ScanResultTile(
                        result: r,
                        onTap: () async {
                          await onConnectPressed(r.device);
                        },
                      ),
                    )
                    .toList(),
          ),
        ),
      ],
    );
  }
}

class IPConnectWidget extends ConsumerStatefulWidget {
  const IPConnectWidget({super.key});

  @override
  ConsumerState<IPConnectWidget> createState() => _ConnectWidgetState();
}

class _ConnectWidgetState extends ConsumerState<IPConnectWidget> {
  @override
  Widget build(BuildContext context) {
    final ipList = ref.watch(ipAddressStreamProvider);

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(4.0),
          child: _WifiProperty(),
        ),
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'IPアドレス',
                style: TextStyleConstant.normal20,
              ),
            ),
            IconButton(
              onPressed: () => context.push('/qr'),
              icon: const Icon(
                Icons.add,
                size: 32,
              ),
            ),
          ],
        ),
        Expanded(
          flex: 1,
          child: ipList.when(
            data: (data) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(data[index].name),
                    subtitle: Text(data[index].address),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ConnectButton(
                          onPressed: () async {
                            ref
                                .read(ipAddressProvider.notifier)
                                .update((state) => data[index].address);
                            ref
                                .read(isWindowsProvider.notifier)
                                .update((state) => data[index].isWindows);

                            if (ref.read(selectedTemplateProvider) == null) {
                              AppSnackBar.of(
                                      messager: ScaffoldMessenger.of(context))
                                  .show('テンプレートを選択してください', SnackBarStatus.info);
                              return;
                            }
                            final testRes = data[index].isWindows
                                ? await sendWindowsTest(ref)
                                : await sendMacTest(ref);
                            if (testRes != null) {
                              context.pushReplacement('/keypad');
                            } else {
                              AppSnackBar.of(
                                      messager: ScaffoldMessenger.of(context))
                                  .show(
                                      'PCとスマホの接続しているWi-Fiが異なるか、Wi-Fiがパブリックなものである可能性があります',
                                      SnackBarStatus.error);
                            }
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.close_rounded),
                          onPressed: () => ref
                              .read(ipAddressRepositoryProvider)
                              .deleteIPAddress(data[index].id!),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            error: (_, __) => const SizedBox.shrink(),
            loading: () => const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}

class _WifiProperty extends StatefulWidget {
  const _WifiProperty({super.key});

  @override
  State<_WifiProperty> createState() => _WifiPropertyState();
}

class _WifiPropertyState extends State<_WifiProperty> {
  List<ConnectivityResult>? connectivityResult;

  @override
  void initState() {
    Future(() async {
      connectivityResult = await (Connectivity().checkConnectivity());
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (connectivityResult == null) {
      return const SizedBox.shrink();
    } else if (connectivityResult!.contains(ConnectivityResult.wifi)) {
      return Text(
        'スマホと接続しているWi-FiがPCと同じである必要があります',
        style:
            TextStyleConstant.bold14.copyWith(color: Colors.deepOrangeAccent),
      );
    } else {
      return Text(
        'スマホをWi-Fiに接続する必要があります',
        style: TextStyleConstant.bold16.copyWith(color: Colors.redAccent),
      );
    }
  }
}
