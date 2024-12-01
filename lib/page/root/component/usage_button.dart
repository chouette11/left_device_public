import 'package:flutter/material.dart';
import 'package:left_device/util/constant/color_constant.dart';
import 'package:left_device/util/constant/custom_button.dart';
import 'package:left_device/util/constant/text_style_constant.dart';

class UsageButton extends StatelessWidget {
  const UsageButton({super.key, required this.isBluetooth});

  final bool isBluetooth;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () async {
        showDialog(
          context: context,
          builder: (context) {
            return const UsageDialog();
          },
        );
      },
      text: '使い方',
    );
  }
}

class UsageDialog extends StatefulWidget {
  const UsageDialog({super.key});

  @override
  State<UsageDialog> createState() => _UsageDialogState();
}

class _UsageDialogState extends State<UsageDialog> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [const _Page1(), const _Page2(), const _Page3()];

    return AlertDialog(
      content: Padding(padding: const EdgeInsets.all(8), child: pages[index]),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if (index == 0) {
                  return;
                }
                index--;
                setState(() {});
              },
              child: const Icon(
                Icons.arrow_left,
                size: 48,
              ),
            ),
            Text('${index + 1} / ${pages.length}'),
            GestureDetector(
              onTap: () {
                if (index == pages.length - 1) {
                  return;
                }
                index++;
                setState(() {});
              },
              child: const Icon(
                Icons.arrow_right,
                size: 48,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _Page1 extends StatefulWidget {
  const _Page1({super.key});

  @override
  State<_Page1> createState() => _Page1State();
}

class _Page1State extends State<_Page1>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380,
      width: 320,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'デスクトップ用アプリの\nダウンロード',
            textAlign: TextAlign.center,
            style:
            TextStyleConstant.bold18.copyWith(color: ColorConstant.black10),
          ),
          TabBar.secondary(
            controller: _tabController,
            tabs: const <Widget>[
              Tab(text: 'Windows'),
              Tab(text: 'Mac'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      '1. PCでMicrosoft Storeを開きます',
                      style: TextStyleConstant.normal16,
                    ),
                    SizedBox(height: 4),
                    Text(
                      '2. 検索欄にスマホで左手デバイスと入力します',
                      style: TextStyleConstant.normal16,
                    ),
                    SizedBox(height: 4),
                    Text(
                      '3. 「スマホで左手デバイス Windows」というアプリをダウンロードしてください',
                      style: TextStyleConstant.normal16,
                    ),
                    SizedBox(height: 4),
                    Text(
                      '4. デスクトップアプリの起動後、ネットワークの許可をしてください',
                      style: TextStyleConstant.normal16,
                    ),
                    SizedBox(height: 4),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      '1. PCでApp Storeを開きます',
                      style: TextStyleConstant.normal16,
                    ),
                    SizedBox(height: 4),
                    Text(
                      '2. 検索欄に「スマホで左手デバイス デスクトップ」と入力します',
                      style: TextStyleConstant.normal16,
                    ),
                    SizedBox(height: 4),
                    Text(
                      '3. 「スマホで左手デバイス デスクトップ」というアプリをダウンロードしてください',
                      style: TextStyleConstant.normal16,
                    ),
                    SizedBox(height: 4),
                    Text(
                      '4. デスクトップアプリの起動後、「アクセシビリティの権限」のボタンを押して許可してください',
                      style: TextStyleConstant.normal16,
                    ),
                    SizedBox(height: 4),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Page2 extends StatefulWidget {
  const _Page2({super.key});

  @override
  State<_Page2> createState() => _Page2State();
}

class _Page2State extends State<_Page2>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 420,
      width: 320,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Bluetoothでの接続',
            textAlign: TextAlign.center,
            style:
            TextStyleConstant.bold18.copyWith(color: ColorConstant.black10),
          ),
          TabBar.secondary(
            controller: _tabController,
            tabs: const <Widget>[
              Tab(text: 'Windows'),
              Tab(text: 'Mac'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      '1. PCで[スタート] → [設定] → [デバイス]のBluetooth設定画面を開きます',
                      style: TextStyleConstant.normal16,
                    ),
                    SizedBox(height: 4),
                    Text(
                      '2. [Bluetoothまたはその他のデバイス追加]を押し、[Bluetooth]を押します',
                      style: TextStyleConstant.normal16,
                    ),
                    SizedBox(height: 4),
                    Text(
                      '3. スマホを選択しペアリングコードを入力します',
                      style: TextStyleConstant.normal16,
                    ),
                    SizedBox(height: 4),
                    Text(
                      '4. 「スキャン」ボタンを押してテンプレートと接続するデバイスを選択してください',
                      style: TextStyleConstant.normal16,
                    ),
                    SizedBox(height: 4),
                    Text(
                      '※お使いのスマホが表示されない場合、スマホもペアリングモードにしてください',
                      style: TextStyleConstant.bold14,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      '1. PCで[システム設定] → [Bluetooth]で設定画面を開きます',
                      style: TextStyleConstant.normal16,
                    ),
                    SizedBox(height: 4),
                    Text(
                      '2. スマホをペアリングモードにします',
                      style: TextStyleConstant.normal16,
                    ),
                    SizedBox(height: 4),
                    Text(
                      '3. 「近くのデバイス」から選択してください',
                      style: TextStyleConstant.normal16,
                    ),
                    SizedBox(height: 4),
                    Text(
                      '4. 「スキャン」ボタンを押してテンプレートと接続するデバイスを選択してください',
                      style: TextStyleConstant.normal16,
                    ),
                    SizedBox(height: 4),
                    Text(
                      '※iPhoneの場合ペアリングの必要はありません',
                      style: TextStyleConstant.bold14,
                    ),
                    SizedBox(height: 4),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Page3 extends StatefulWidget {
  const _Page3({super.key});

  @override
  State<_Page3> createState() => _Page3State();
}

class _Page3State extends State<_Page3>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 320,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'ネットワークでの接続',
            textAlign: TextAlign.center,
            style:
            TextStyleConstant.bold18.copyWith(color: ColorConstant.black10),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      '1. このアプリの「IPアドレス」の右にある＋ボタンをタップします',
                      style: TextStyleConstant.normal16,
                    ),
                    SizedBox(height: 4),
                    Text(
                      '2. カメラの許可をします',
                      style: TextStyleConstant.normal16,
                    ),
                    SizedBox(height: 4),
                    Text(
                      '3. デスクトップアプリを起動し、表示されているQRコードを読み取ります',
                      style: TextStyleConstant.normal16,
                    ),
                    SizedBox(height: 4),
                    Text(
                      '4. テンプレートと接続するIPアドレスを選択してください',
                      style: TextStyleConstant.normal16,
                    ),
                    SizedBox(height: 4),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      '1. このアプリの「IPアドレス」の右にある＋ボタンをタップします',
                      style: TextStyleConstant.normal16,
                    ),
                    SizedBox(height: 4),
                    Text(
                      '2. カメラの許可をします',
                      style: TextStyleConstant.normal16,
                    ),
                    SizedBox(height: 4),
                    Text(
                      '3. デスクトップアプリを起動し、表示されているQRコードを読み取ります',
                      style: TextStyleConstant.normal16,
                    ),
                    SizedBox(height: 4),
                    Text(
                      '4. テンプレートと接続するIPアドレスを選択してください',
                      style: TextStyleConstant.normal16,
                    ),
                    SizedBox(height: 4),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
