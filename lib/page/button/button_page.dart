import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:left_device/model/entity/action/action_entity.dart';
import 'package:left_device/model/entity/button/button_entity.dart';
import 'package:left_device/page/button/component/hotkey_dialog.dart';
import 'package:left_device/page/component/keypad_button.dart';
import 'package:left_device/provider/domain_providers.dart';
import 'package:left_device/provider/presentation_providers.dart';
import 'package:left_device/repository/button_repository.dart';
import 'package:left_device/util/constant/color_constant.dart';
import 'package:left_device/util/constant/custom_button.dart';
import 'package:left_device/util/constant/text_style_constant.dart';
import 'package:left_device/util/enum/action.dart';

class ButtonPage extends ConsumerStatefulWidget {
  const ButtonPage({super.key, required this.buttonEntity});

  final ButtonEntity? buttonEntity;

  @override
  ConsumerState<ButtonPage> createState() => _EditPageState();
}

class _EditPageState extends ConsumerState<ButtonPage> {
  ActionTypeEnum actionType = ActionTypeEnum.hotkey;
  String label = '';
  Color? selectedColor;

  @override
  void initState() {
    if (widget.buttonEntity != null) {
      label = widget.buttonEntity!.label;
      actionType = widget.buttonEntity!.action.type;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final macKey = ref.watch(macKeyProvider);
    final windowsKey = ref.watch(windowsKeyProvider);
    final isPro = ref.watch(isProUserProvider);
    final app = ref.watch(appOpenProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: Stack(
                children: [
                  KeypadButtonDesign(
                    buttonEntity: ButtonEntity(
                      color: selectedColor,
                      label: label,
                      isVisible: true,
                      action: const ActionEntity(
                        type: ActionTypeEnum.none,
                        windowsValue: '',
                        macValue: '',
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.edit),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.transparent,
                        ),
                        onChanged: (String value) {
                          setState(() {
                            label = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const ListTile(
              title: Text(
                'hotキー',
                style: TextStyleConstant.bold18,
              ),
            ),
            // RadioListTile(
            //   title: const Text('hotキー'),
            //   value: ActionTypeEnum.hotkey,
            //   groupValue: actionType,
            //   onChanged: (ActionTypeEnum? value) {
            //     setState(() {
            //       if (value != null) {
            //         actionType = value;
            //       }
            //     });
            //   },
            // ),
            ListTile(
              title: Text('Mac: $macKey'),
              trailing: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(8)),
                    ),
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: const HotKeyDialog(false),
                      );
                    },
                  );
                },
                icon: const Icon(Icons.edit),
              ),
            ),
            ListTile(
              title: Text('Windows: $windowsKey'),
              trailing: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(8)),
                    ),
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: const HotKeyDialog(true),
                      );
                    },
                  );
                },
                icon: const Icon(Icons.edit),
              ),
            ),
            // RadioListTile(
            //   title: const Text('アプリ起動'),
            //   value: ActionTypeEnum.appOpen,
            //   groupValue: actionType,
            //   onChanged: (ActionTypeEnum? value) {
            //     setState(() {
            //       if (value != null) {
            //         actionType = value;
            //       }
            //     });
            //   },
            // ),
            // ListTile(
            //   title: Text('app: $app'),
            //   trailing: IconButton(
            //     onPressed: () {
            //       showModalBottomSheet(
            //         shape: const RoundedRectangleBorder(
            //           borderRadius:
            //               BorderRadius.vertical(top: Radius.circular(8)),
            //         ),
            //         isScrollControlled: true,
            //         context: context,
            //         builder: (BuildContext context) {
            //           return Padding(
            //             padding: EdgeInsets.only(
            //               bottom: MediaQuery.of(context).viewInsets.bottom,
            //             ),
            //             child: const AppOpenDialog(false),
            //           );
            //         },
            //       );
            //     },
            //     icon: const Icon(Icons.edit),
            //   ),
            // ),
            isPro.when(
                data: (data) {
                  if (data) {
                    return ListTile(
                      title: Row(
                        children: [
                          const Text('色:'),
                          const SizedBox(width: 32),
                          ColorWidget(
                            color: ColorConstant.defaultButton,
                            onPressed: () {
                              setState(() {
                                selectedColor = ColorConstant.defaultButton;
                              });
                            },
                          ),
                          ColorWidget(
                            color: ColorConstant.button1,
                            onPressed: () {
                              setState(() {
                                selectedColor = ColorConstant.button1;
                              });
                            },
                          ),
                          ColorWidget(
                            color: ColorConstant.button2,
                            onPressed: () {
                              setState(() {
                                selectedColor = ColorConstant.button2;
                              });
                            },
                          ),
                          ColorWidget(
                            color: ColorConstant.button3,
                            onPressed: () {
                              setState(() {
                                selectedColor = ColorConstant.button3;
                              });
                            },
                          ),
                          ColorWidget(
                            color: ColorConstant.button4,
                            onPressed: () {
                              setState(() {
                                selectedColor = ColorConstant.button4;
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
                error: (_, __) => const SizedBox.shrink(),
                loading: () => const SizedBox.shrink()),
            const SizedBox(height: 24),
            CustomButton(
              onPressed: () {
                String macValue = '';
                String windowsValue = '';
                if (actionType == ActionTypeEnum.none) {
                  return;
                } else if (actionType == ActionTypeEnum.hotkey) {
                  macValue = ref.read(macKeyProvider);
                  windowsValue = ref.read(windowsKeyProvider);
                } else if (actionType == ActionTypeEnum.appOpen) {
                  macValue = ref.read(appOpenProvider);
                  windowsValue = ref.read(appOpenProvider);
                }

                final buttonEntity = ButtonEntity(
                  color: selectedColor,
                  label: label,
                  isVisible: true,
                  action: ActionEntity(
                    type: actionType,
                    windowsValue: windowsValue,
                    macValue: macValue,
                  ),
                );
                ref.read(buttonRepositoryProvider).addButton(buttonEntity);
                context.pop();
              },
              text: 'OK',
            )
          ],
        ),
      ),
    );
  }
}

class ColorWidget extends StatelessWidget {
  const ColorWidget({super.key, required this.color, required this.onPressed});

  final Color color;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(),
          ),
        ),
      ),
    );
  }
}
