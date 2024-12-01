import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:left_device/provider/presentation_providers.dart';
import 'package:left_device/util/constant/color_constant.dart';

class AppOpenDialog extends ConsumerStatefulWidget {
  const AppOpenDialog(this.isWindows, {super.key});

  final bool isWindows;

  @override
  ConsumerState<AppOpenDialog> createState() => _HotKeyDialogState();
}

class _HotKeyDialogState extends ConsumerState<AppOpenDialog> {
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
              TextFormField(
                textInputAction: TextInputAction.done,
                controller: controller,
                onFieldSubmitted: (value) {
                  setState(() {
                    if (value != '') {
                      ref
                          .read(appOpenProvider.notifier)
                          .update((state) => value);
                      controller.text = '';
                      context.pop();
                    }
                  });
                },
                autofocus: true,
                cursorColor: ColorConstant.black0,
                decoration: InputDecoration(
                  hintText: '開くアプリ名を入力してください',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        final value = controller.text;
                        if (value != '') {
                          ref
                              .read(appOpenProvider.notifier)
                              .update((state) => value);
                          controller.text = '';
                          context.pop();
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
              // SizedBox(
              //   height: 160,
              //   child: GridView.count(
              //       primary: false,
              //       childAspectRatio: 2,
              //       crossAxisSpacing: 10,
              //       mainAxisSpacing: 10,
              //       crossAxisCount: 4,
              //       children: widget.isWindows
              //           ? WindowsHotkeyEnum.values.map(
              //               (e) {
              //                 if (e.displayName == '決定') {
              //                   return ElevatedButton(
              //                     onPressed: () {
              //                       String value = '';
              //                       for (final key in added) {
              //                         value += '$key ';
              //                       }
              //                       if (widget.isWindows) {
              //                       } else {
              //                         ref
              //                             .read(macKeyProvider.notifier)
              //                             .update((state) => value);
              //                       }
              //                       context.pop();
              //                     },
              //                     child: Text(e.displayName),
              //                   );
              //                 } else {
              //                   return Card(
              //                     child: InkWell(
              //                       onTap: () {
              //                         added.add(e.value);
              //                         setState(() {});
              //                       },
              //                       child: Center(
              //                         child: Text(e.displayName),
              //                       ),
              //                     ),
              //                   );
              //                 }
              //               },
              //             ).toList()
              //           : MacHotKeyEnum.values.map(
              //               (e) {
              //                 if (e.displayName == '決定') {
              //                   return  ElevatedButton(
              //                     style: ButtonStyle(
              //                       foregroundColor: WidgetStateProperty.all(Colors.white),
              //                       backgroundColor: WidgetStateProperty.all(Colors.purple)
              //                     ),
              //                     onPressed: () {
              //                       String value = '';
              //                       for (final key in added) {
              //                         value += '$key ';
              //                       }
              //                       if (widget.isWindows) {
              //                         // ref
              //                         //     .read(windowsKeyProvider.notifier)
              //                         //     .update((state) => value);
              //                       } else {
              //                         ref
              //                             .read(macKeyProvider.notifier)
              //                             .update((state) => value);
              //                       }
              //                       context.pop();
              //                     },
              //                     child: Text(e.displayName),
              //                   );
              //                 } else {
              //                   return Card(
              //                     child: InkWell(
              //                       onTap: () {
              //                         added.add(e.value);
              //                         setState(() {});
              //                       },
              //                       child: Center(
              //                         child: Text(e.displayName),
              //                       ),
              //                     ),
              //                   );
              //                 }
              //               },
              //             ).toList()),
              // ),
              const SizedBox(height: 8)
            ],
          ),
        ),
      ),
    );
  }
}
