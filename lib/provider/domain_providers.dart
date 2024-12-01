import 'package:flutter/services.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:left_device/ignore/revenue_data_source.dart';
import 'package:left_device/model/entity/button/button_entity.dart';
import 'package:left_device/page/billing/bilinng_page.dart';
import 'package:left_device/page/button/button_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:left_device/page/keypad/bluetooth_keypad_page.dart';
import 'package:left_device/page/keypad/keypad_page.dart';
import 'package:left_device/page/root/children/qr/qr_page.dart';
import 'package:left_device/page/template/template_page.dart';
import 'package:uuid/uuid.dart';
import 'package:left_device/page/root/root_page.dart';

final firebaseAuthProvider = Provider((_) => FirebaseAuth.instance);

final uuidProvider = Provider((_) => const Uuid());

final isProUserProvider = FutureProvider<bool>(
  (ref) async => await ref.read(revenueProvider).getIsProUser(),
);

/// ページ遷移のプロバイダ
final routerProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
          ]);
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
          return const RootPage();
        },
        routes: [
          GoRoute(path: 'qr', builder: (context, state) => const QRPage()),
          GoRoute(
            path: 'template',
            builder: (context, state) =>
                TemplatePage(isPro: state.extra as bool),
          ),
          GoRoute(
            path: 'button',
            builder: (context, state) =>
                ButtonPage(buttonEntity: state.extra as ButtonEntity?),
          ),
          GoRoute(
            path: 'keypad',
            builder: (context, state) {
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.landscapeLeft,
                DeviceOrientation.landscapeRight,
              ]);
              SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

              return const KeypadPage();
            },
          ),
          GoRoute(
              path: 'bluetooth_keypad',
              builder: (context, state) {
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.landscapeLeft,
                  DeviceOrientation.landscapeRight,
                ]);
                SystemChrome.setEnabledSystemUIMode(
                  SystemUiMode.immersive,
                );
                return BluetoothKeypadPage(
                  device: state.extra as BluetoothDevice,
                );
              }),
          GoRoute(
            path: 'billing',
            builder: (context, state) => const BillingPage(),
          ),
        ],
      ),
    ],
  ),
);
