import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cryptography/cryptography.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:left_device/ignore/c.dart';
import 'package:left_device/model/entity/action/action_entity.dart';
import 'package:http/http.dart' as http;
import 'package:left_device/provider/presentation_providers.dart';

void sendMacData(ActionEntity action, WidgetRef ref) async {
  final address = ref.read(ipAddressProvider);
  const storage = FlutterSecureStorage();
  String? keyString = await storage.read(key: 'shared_secret_key');
// 秘密鍵の復元
  Uint8List keyData = base64Decode(keyString!);
  final secretKey = SecretKey(keyData);

// メッセージの暗号化
  final algorithm = AesGcm.with256bits();
  final nonce = algorithm.newNonce();
  final message = '${action.type.name}_+_${action.macValue}';
  final encrypted = await algorithm.encrypt(
    utf8.encode(message),
    secretKey: secretKey,
    nonce: nonce,
  );

// encrypted = SecretBox(cipherText, nonce: nonce, mac: mac)
  final encryptedData = encrypted.concatenation();
  print('send');

// リクエストの送信
  try {
    // HttpClientの作成
    HttpClient client = HttpClient()
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;

    // リクエストの作成
    HttpClientRequest request =
        await client.postUrl(Uri.parse('https://$address:5111'));
    request.headers.set('Content-Type', 'application/octet-stream');
    request.add(encryptedData);

    // レスポンスの取得
    HttpClientResponse response = await request.close();

    if (response.statusCode == 200) {
      // レスポンスの復号
      final responseBodyBytes =
          await consolidateHttpClientResponseBytes(response);
      final secretBox = SecretBox.fromConcatenation(
        responseBodyBytes,
        nonceLength: 12,
        macLength: 16,
      );
      final decryptedData = await algorithm.decrypt(
        secretBox,
        secretKey: secretKey,
      );
      String responseMessage = utf8.decode(decryptedData);
      if (kDebugMode) {
        print(responseMessage);
      }
    } else {
      if (kDebugMode) {
        print('ステータスコード: ${response.statusCode}');
      }
    }

    // クライアントの終了
    client.close();
  } catch (e) {
    if (kDebugMode) {
      print('エラー: $e');
    }
  }
}

void sendWindowsData(ActionEntity action, WidgetRef ref) async {
  final address = ref.read(ipAddressProvider);
  final response = await http.post(
    Uri.parse('http://$address:5111/data'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'data': '${action.type.name}_+_${action.windowsValue}',
    }),
  );

  if (response.statusCode == 200) {
    print('Success: ${response.body}');
  } else {
    print('Failed to send data');
  }
}

Future<String?> sendMacTest(WidgetRef ref) async {
  final address = ref.read(ipAddressProvider);
  const storage = FlutterSecureStorage();
  String? keyString = await storage.read(key: 'shared_secret_key');
  // 秘密鍵の復元
  Uint8List keyData = base64Decode(keyString!);
  final secretKey = SecretKey(keyData);

  // メッセージの暗号化
  final algorithm = AesGcm.with256bits();
  final nonce = algorithm.newNonce();
  const message = 'test';
  final encrypted = await algorithm.encrypt(
    utf8.encode(message),
    secretKey: secretKey,
    nonce: nonce,
  );

// encrypted = SecretBox(cipherText, nonce: nonce, mac: mac)
  final encryptedData = encrypted.concatenation();
  print('send');

// リクエストの送信
  try {
    // HttpClientの作成
    HttpClient client = HttpClient()
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;

    // リクエストの作成
    HttpClientRequest request = await client
        .postUrl(Uri.parse('https://$address:5111'))
        .timeout(const Duration(seconds: 3));
    request.headers.set('Content-Type', 'application/octet-stream');
    request.add(encryptedData);

    // レスポンスの取得
    HttpClientResponse response =
        await request.close().timeout(const Duration(seconds: 3));

    if (response.statusCode == 200) {
      // レスポンスの復号
      final responseBodyBytes =
          await consolidateHttpClientResponseBytes(response);
      final secretBox = SecretBox.fromConcatenation(
        responseBodyBytes,
        nonceLength: 12,
        macLength: 16,
      );
      final decryptedData = await algorithm.decrypt(
        secretBox,
        secretKey: secretKey,
      );
      String responseMessage = utf8.decode(decryptedData);
      return responseMessage;
    } else {
      if (kDebugMode) {
        print('ステータスコード: ${response.statusCode}');
      }
    }

    // クライアントの終了
    client.close();
  } on TimeoutException catch (e) {
    print('Request timed out: $e');
  } on SocketException catch (e) {
    print('Connection error: $e');
  } catch (e) {
    if (kDebugMode) {
      print('エラー: $e');
    }
  }
}

Future<String?> sendWindowsTest(WidgetRef ref) async {
  final address = ref.read(ipAddressProvider);
  print('send');

  try {
    final response = await http
        .post(
          Uri.parse('http://$address:5111/data'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'data': 'test ddd',
          }),
        )
        .timeout(const Duration(seconds: 3)); // タイムアウトを設定

    if (response.statusCode == 200) {
      return response.body;
    } else {
      print('Failed to send data: ${response.statusCode}');
    }
  } on http.ClientException catch (e) {
    print('ClientException occurred: $e');
  } on TimeoutException catch (e) {
    print('Request timed out: $e');
  } on SocketException catch (e) {
    print('Connection error: $e');
  } catch (e) {
    print('An unexpected error occurred: $e');
  }
}

Future<void> sendBlueWindowsData(
    BluetoothService service, ActionEntity action) async {
  final c = service.characteristics
      .firstWhere((c) => c.uuid.str == BLUETOOTH_CHARACTERISTIC_WINDOWS_UUID);
  await c.write(utf8.encode("${action.type.name}_+_${action.windowsValue}"),
      withoutResponse: c.properties.writeWithoutResponse);
  if (c.properties.read) {
    await c.read();
  }
}

Future<void> sendBlueMacData(
    BluetoothService service, ActionEntity action) async {
  final c = service.characteristics
      .firstWhere((c) => c.uuid.str == BLUETOOTH_CHARACTERISTIC_MAC_UUID);
  await c.write(utf8.encode("${action.type.name}_+_${action.macValue}"),
      withoutResponse: c.properties.writeWithoutResponse);

  if (c.properties.read) {
    await c.read();
  }
}
