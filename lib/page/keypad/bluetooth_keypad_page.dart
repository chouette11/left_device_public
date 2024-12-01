import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:left_device/ignore/c.dart';
import 'package:left_device/page/keypad/component/keypad_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:left_device/page/root/children/bluetooth/extra.dart';
import 'package:left_device/provider/presentation_providers.dart';

class BluetoothKeypadPage extends ConsumerStatefulWidget {
  const BluetoothKeypadPage({
    Key? key,
    required this.device,
  }) : super(key: key);
  final BluetoothDevice device;

  @override
  ConsumerState<BluetoothKeypadPage> createState() => _KeypadPageState();
}

class _KeypadPageState extends ConsumerState<BluetoothKeypadPage> {
  BluetoothConnectionState _connectionState =
      BluetoothConnectionState.disconnected;
  List<BluetoothService> _services = [];
  late StreamSubscription<BluetoothConnectionState>
      _connectionStateSubscription;
  late StreamSubscription<bool> _isDisconnectingSubscription;

  @override
  void initState() {
    Future(() async {
      await widget.device.connectAndUpdateStream();
      onDiscoverServicesPressed();
      setState(() {});
    });
    super.initState();

    _connectionStateSubscription =
        widget.device.connectionState.listen((state) async {
      _connectionState = state;
      if (state == BluetoothConnectionState.connected) {
        _services = []; // must rediscover services
      }
      if (state == BluetoothConnectionState.disconnected) {
        await widget.device.connectAndUpdateStream();
        onDiscoverServicesPressed();
        setState(() {});
      }
      if (mounted) {
        setState(() {});
      }
    });

    _isDisconnectingSubscription =
        widget.device.isDisconnecting.listen((value) {
      widget.device.connectAndUpdateStream();
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _connectionStateSubscription.cancel();
    _isDisconnectingSubscription.cancel();
    super.dispose();
  }

  bool get isConnected {
    return _connectionState == BluetoothConnectionState.connected;
  }

  Future onDiscoverServicesPressed() async {
    _services = await widget.device.discoverServices();
    final service = _services.firstWhere(
        (s) => s.uuid.str == BLUETOOTH_SERVICE_UUID);
    ref.read(serviceProvider.notifier).update((_) => service);
  }

  @override
  Widget build(BuildContext context) {
    final templateEntity = ref.watch(selectedTemplateProvider);
    final type = templateEntity!.type;
    if (type.type == 'numeric') {
      return PopScope(
        canPop: false,
        onPopInvoked: (_) {
          ref.read(serviceProvider.notifier).update((_) => null);
          context.pushReplacement('/');
        },
        child: Material(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: NumericKeypad(templateEntity: templateEntity),
          ),
        ),
      );
    } else {
      return PopScope(
        canPop: false,
        onPopInvoked: (_) {
          ref.read(serviceProvider.notifier).update((_) => null);
          context.pushReplacement('/');
        },
        child: Material(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: NormalKeypad(templateEntity: templateEntity),
          ),
        ),
      );
    }
  }
}
