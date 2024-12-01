import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:left_device/provider/presentation_providers.dart';
import 'package:left_device/util/constant/color_constant.dart';
import 'package:left_device/util/enum/hotkey.dart';

class HotKeyDialog extends ConsumerStatefulWidget {
  const HotKeyDialog(this.isWindows, {super.key});

  final bool isWindows;

  @override
  ConsumerState<HotKeyDialog> createState() => _HotKeyDialogState();
}

class _HotKeyDialogState extends ConsumerState<HotKeyDialog> {
  List<String> added = [];
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              Visibility(
                visible: added.isNotEmpty,
                child: SizedBox(
                  height: 32,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: added
                        .map(
                          (label) => GestureDetector(
                            onTap: () {
                              setState(() {
                                added.removeWhere((e) => e == label);
                              });
                            },
                            child: Container(
                              height: 32,
                              padding: const EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 12,
                              ),
                              margin: const EdgeInsets.only(right: 4),
                              decoration: BoxDecoration(
                                color: ColorConstant.black90,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Row(
                                children: [
                                  Text(label),
                                  const Icon(Icons.clear, size: 16)
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              TextFormField(
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.emailAddress,
                controller: controller,
                onFieldSubmitted: (value) {
                  setState(() {
                    if (value != '') {
                      added.add(value.trim());
                      controller.text = '';
                    }
                  });
                },
                autofocus: true,
                cursorColor: ColorConstant.black0,
                decoration: InputDecoration(
                  hintText: 'その他のキーを入力してください',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        final value = controller.text;
                        if (value != '') {
                          added.add(value.trim());
                          controller.text = '';
                        }
                      });
                    },
                    icon: const Icon(Icons.check),
                  ),
                  // hintText: context.l10n.task,
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                        // color: ColorConstant.purple40,
                        ),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                        // color: ColorConstant.purple40,
                        ),
                  ),
                ),
              ),
              SizedBox(
                height: 160,
                child: GridView.count(
                    primary: false,
                    childAspectRatio: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 4,
                    children: widget.isWindows
                        ? WindowsHotkeyEnum.values.map(
                            (e) {
                              if (e.displayName == '決定') {
                                return _DecideButton(
                                  isWindows: widget.isWindows,
                                  added: added,
                                );
                              } else {
                                return Card(
                                  child: InkWell(
                                    onTap: () {
                                      added.add(e.value);
                                      setState(() {});
                                    },
                                    child: Center(
                                      child: Text(e.displayName),
                                    ),
                                  ),
                                );
                              }
                            },
                          ).toList()
                        : MacHotKeyEnum.values.map(
                            (e) {
                              if (e.displayName == '決定') {
                                return _DecideButton(
                                  isWindows: widget.isWindows,
                                  added: added,
                                );
                              } else {
                                return Card(
                                  child: InkWell(
                                    onTap: () {
                                      added.add(e.value);
                                      setState(() {});
                                    },
                                    child: Center(
                                      child: Text(e.displayName),
                                    ),
                                  ),
                                );
                              }
                            },
                          ).toList()),
              ),
              const SizedBox(height: 8)
            ],
          ),
        ),
      ),
    );
  }
}

class _DecideButton extends ConsumerWidget {
  const _DecideButton({
    super.key,
    required this.isWindows,
    required this.added,
  });

  final bool isWindows;
  final List<String> added;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(Colors.white),
          backgroundColor: WidgetStateProperty.all(Colors.purple)),
      onPressed: () {
        String value = '';
        for (final key in added) {
          value += '$key ';
        }
        if (isWindows) {
          ref.read(windowsKeyProvider.notifier).update((state) => value);
        } else {
          ref.read(macKeyProvider.notifier).update((state) => value);
        }
        context.pop();
      },
      child: const Text('決定'),
    );
  }
}
