import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:left_device/ignore/revenue_data_source.dart';
import 'package:left_device/model/entity/action/action_entity.dart';
import 'package:left_device/model/entity/button/button_entity.dart';
import 'package:left_device/model/entity/template/template_entity.dart';
import 'package:left_device/page/root/component/connect_widget.dart';
import 'package:left_device/page/root/component/root_template_widget.dart';
import 'package:left_device/page/root/component/usage_button.dart';
import 'package:left_device/provider/presentation_providers.dart';
import 'package:left_device/repository/button_repository.dart';
import 'package:left_device/repository/template_repository.dart';
import 'package:left_device/repository/user_repository.dart';
import 'package:left_device/util/constant/text_style_constant.dart';
import 'package:left_device/util/enum/action.dart';
import 'package:left_device/util/enum/template.dart';

class RootPage extends ConsumerStatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  ConsumerState<RootPage> createState() => _RootPageState();
}

class _RootPageState extends ConsumerState<RootPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Future(
        () async {
          final isLaunch = await ref.read(userRepositoryProvider).getIsLaunch();
          if (!isLaunch) {
            showDialog(context: context, builder: (context) => const UsageDialog());
            const buttonMap = {
              1: ButtonEntity(
                id: 1,
                label: 'スクショ',
                action: ActionEntity(
                  type: ActionTypeEnum.hotkey,
                  windowsValue: 'win shift s',
                  macValue: 'command shift 3',
                ),
                isVisible: true,
              ),
              2: ButtonEntity(
                id: 2,
                label: 'コピー',
                action: ActionEntity(
                  type: ActionTypeEnum.hotkey,
                  windowsValue: 'ctrl c',
                  macValue: 'command c',
                ),
                isVisible: true,
              ),
              3: ButtonEntity(
                id: -1,
                label: '広告',
                action: ActionEntity(
                  type: ActionTypeEnum.none,
                  windowsValue: '',
                  macValue: '',
                ),
                isVisible: true,
              ),
              4: ButtonEntity(
                id: 3,
                label: 'ペースト',
                action: ActionEntity(
                  type: ActionTypeEnum.hotkey,
                  windowsValue: 'ctrl v',
                  macValue: 'command v',
                ),
                isVisible: true,
              ),
            };
            const template = TemplateEntity(
              name: 'デフォルト',
              buttonMap: buttonMap,
              type: TemplateEnum.numeric_4,
              isVisible: true,
            );
            await ref.read(buttonRepositoryProvider).addButton(buttonMap[1]!);
            await ref.read(buttonRepositoryProvider).addButton(buttonMap[2]!);
            await ref.read(buttonRepositoryProvider).addButton(buttonMap[4]!);
            await ref.read(templateRepositoryProvider).addTemplate(template);
            ref.invalidate(templatesProvider);
          }
        },
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final templates = ref.watch(templatesProvider);
    final isBluetooth = ref.watch(isBluetoothProvider);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UsageButton(isBluetooth: isBluetooth),
                    Row(
                      children: [
                        Text(
                          'bluetooth',
                          style: !isBluetooth
                              ? TextStyleConstant.normal14
                              : TextStyleConstant.bold14,
                        ),
                        CupertinoSwitch(
                          value: !isBluetooth,
                          trackColor: Colors.blueAccent,
                          activeColor: Colors.red,
                          onChanged: (bool value) {
                            // This is called when the user toggles the switch.
                            setState(() {
                              ref
                                  .read(isBluetoothProvider.notifier)
                                  .update((state) => !state);
                            });
                          },
                        ),
                        Text(
                          'Network',
                          style: isBluetooth
                              ? TextStyleConstant.normal14
                              : TextStyleConstant.bold14,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                child: isBluetooth
                    ? const BluetoothConnectWidget()
                    : const IPConnectWidget(),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'テンプレート',
                      style: TextStyleConstant.normal20,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      final isPro =
                          await ref.read(revenueProvider).getIsProUser();
                      context.push('/template', extra: isPro);
                    },
                    icon: const Icon(
                      Icons.add,
                      size: 32,
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 2,
                child: templates.when(
                  data: (data) {
                    final selectedTemp = ref.watch(selectedTemplateProvider);
                    return GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                      crossAxisCount: 2,
                      children: data
                          .where((e) => e.isVisible == true)
                          .toList()
                          .map(
                            (e) => GestureDetector(
                              onTap: () async {
                                ref
                                    .read(selectedTemplateProvider.notifier)
                                    .update((state) => e);
                              },
                              child: Card.outlined(
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Container(
                                    color: e.id == selectedTemp?.id
                                        ? Colors.grey
                                        : Colors.transparent,
                                    child: GridTile(
                                      footer: Center(
                                          child: Text(
                                        e.name,
                                        style: TextStyleConstant.bold14,
                                      )),
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 8),
                                        child: Stack(
                                          children: [
                                            RootTemplateWidget(templateEntity: e),
                                            GestureDetector(
                                              onTap: () async {
                                                await ref
                                                    .read(
                                                        templateRepositoryProvider)
                                                    .removeTemplate(e);
                                                ref.invalidate(templatesProvider);
                                              },
                                              child: const Align(
                                                alignment: Alignment.topRight,
                                                child: Icon(
                                                  Icons.close_rounded,
                                                  size: 36,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    );
                  },
                  error: (_, __) => Text(_.toString()),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showMenu(BuildContext context, String name) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: 120,
        child: Column(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit'),
              onTap: () {
                Navigator.pop(context);
                print('Edit $name');
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Delete'),
              onTap: () {
                Navigator.pop(context);
                print('Delete $name');
              },
            ),
          ],
        ),
      );
    },
  );
}
