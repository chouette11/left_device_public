import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:left_device/model/entity/ip_address/ip_address_entity.dart';
import 'package:left_device/page/component/appbar.dart';
import 'package:left_device/repository/ip_address_repository.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRPage extends ConsumerStatefulWidget {
  const QRPage({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _QRPageState();
}

class _QRPageState extends ConsumerState<QRPage> {
  Barcode? result;
  bool isScan = false;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    final scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    const String ipPattern =
        r'\b(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b';

    final RegExp regExp = RegExp(ipPattern);
    String ipAddress = '';
    print(result?.code);

    List<String>? components = result?.code?.split('_');
    if (components != null && components.length > 2) {
      ipAddress = components[0];
      if (regExp.hasMatch(ipAddress) && !isScan) {
        isScan = true;
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              final TextEditingController controller0 = TextEditingController();
              return AlertDialog(
                title: Text(ipAddress),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: controller0,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '判別できる名前を入力してください',
                      ),
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () async {
                      final isWindows = components.length == 3 ? components[2] : '';
                      if (!(isWindows == 'windows')) {
                        const storage = FlutterSecureStorage();
                        String keyString = components[1];
                        // 秘密鍵とIPアドレスを安全に保存
                        await storage.write(
                            key: 'shared_secret_key', value: keyString);
                      }
                      final ipAddressEntity = IPAddressEntity(
                        name: controller0.text,
                        address: ipAddress,
                        isWindows: isWindows == 'windows' ? true : false,
                      );

                      await ref
                          .read(ipAddressRepositoryProvider)
                          .addIpAddress(ipAddressEntity);
                      context.go('/');
                    },
                  ),
                ],
              );
            },
          );
        });
      }
    }
    return Scaffold(
      appBar: const CustomAppbar(),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                  borderColor: Colors.red,
                  borderRadius: 10,
                  borderLength: 30,
                  borderWidth: 10,
                  cutOutSize: scanArea),
              onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
            ),
          ),
          const Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('デスクトップアプリのQRコードをスキャンしてください'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
