import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:left_device/ignore/ad/gdpr.dart';
import 'package:left_device/ignore/revenue_data_source.dart';
import 'package:left_device/page/component/appbar.dart';
import 'package:left_device/page/snack.dart';
import 'package:left_device/provider/domain_providers.dart';
import 'package:left_device/util/constant/color_constant.dart';
import 'package:left_device/util/constant/text_style_constant.dart';
import 'package:url_launcher/url_launcher.dart';

class BillingPage extends ConsumerStatefulWidget {
  const BillingPage({super.key});

  @override
  ConsumerState<BillingPage> createState() => _BillingPageState();
}

class _BillingPageState extends ConsumerState<BillingPage> {
  bool isGDPR = false;

  @override
  void initState() {
    Future(() async => isGDPR = await isUnderGdpr());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isPro = ref.watch(isProUserProvider);
    return Scaffold(
      appBar: const CustomAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: SizedBox(
                    width: 52,
                    height: 52,
                    child: Image.asset('assets/images/app_icon.png'),
                  ),
                ),
                const SizedBox(width: 16),
                const Text(
                  'プレミアムサービス',
                  style: TextStyleConstant.bold24,
                ),
              ],
            ),
            const SizedBox(height: 36),
            _Item(
              title: '広告を全て非表示',
              icon: Stack(
                alignment: Alignment.center,
                children: [
                  const Icon(Icons.block, size: 48),
                  RichText(
                    textAlign: TextAlign.end,
                    text: const TextSpan(children: [
                      TextSpan(
                        text: 'A',
                        style: TextStyle(
                          fontSize: 24,
                          color: ColorConstant.black40,
                        ),
                      ),
                      TextSpan(
                        text: 'd',
                        style: TextStyle(
                          fontSize: 20,
                          color: ColorConstant.black40,
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const _Item(
              title: 'ボタンカラーの追加',
              icon: Icon(
                Icons.color_lens,
                size: 48,
              ),
            ),
            const SizedBox(height: 48),
            const Text(
              'あなたのサブスクがアプリ制作者の生きる糧となり\nアプリの機能向上に繋がります！',
              textAlign: TextAlign.center,
              style: TextStyleConstant.normal12,
            ),
            const SizedBox(height: 48),
            isPro.when(
              data: (data) {
                if (data) {
                  return const Text(
                    '登録済みです！',
                    style: TextStyleConstant.bold16,
                  );
                } else {
                  return ElevatedButton(
                    child: const Text(
                      '¥ 490 / 月',
                      style: TextStyleConstant.normal20,
                    ),
                    onPressed: () async {
                      await ref.read(revenueProvider).buyMonthly();
                      ref.invalidate(isProUserProvider);
                    },
                  );
                }
              },
              error: (_, __) => const Text('エラーです'),
              loading: () => const SizedBox.shrink(),
            ),
            const SizedBox(height: 8),
            Text(
              '※キャンセルしない限り自動更新されます',
              style: TextStyleConstant.normal14
                  .copyWith(color: ColorConstant.black40),
              overflow: TextOverflow.clip,
            ),
            Text(
              '※予告なしに内容が変更される可能性があります',
              style: TextStyleConstant.normal14
                  .copyWith(color: ColorConstant.black40),
              overflow: TextOverflow.clip,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () async {
                      await ref.read(revenueProvider).restore();
                      AppSnackBar.of(messager: ScaffoldMessenger.of(context))
                          .show('復元の記録が見つかりません。\nもう一度ご確認ください。',
                              SnackBarStatus.info);
                    },
                    child: Text(
                      '購入履歴を復元する',
                      style: TextStyleConstant.normal14
                          .copyWith(color: Colors.indigo),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () => _launchUrl(
                          Uri.parse(
                              'https://lovely-year-a00.notion.site/30a3c01ed324416bb236386b0cde88c5'),
                        ),
                        child: Text(
                          '利用規約',
                          style: TextStyleConstant.normal12
                              .copyWith(color: Colors.blueAccent),
                        ),
                      ),
                      TextButton(
                        onPressed: () => _launchUrl(
                          Uri.parse('https://left-device-macos.web.app'),
                        ),
                        child: Text(
                          'プライバシーポリシー',
                          style: TextStyleConstant.normal12
                              .copyWith(color: Colors.blueAccent),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: isGDPR,
                        child: TextButton(
                          onPressed: () => changeGDPR(),
                          child: Text(
                            'GDPR',
                            style: TextStyleConstant.normal12
                                .copyWith(color: Colors.blueAccent),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({Key? key, required this.icon, required this.title})
      : super(key: key);
  final Widget icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        Text(
          title,
          style: TextStyleConstant.normal20,
        )
      ],
    );
  }
}

Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
