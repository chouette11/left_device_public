import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:left_device/model/entity/action/action_entity.dart';
import 'package:left_device/model/entity/button/button_entity.dart';
import 'package:left_device/model/entity/template/template_entity.dart';
import 'package:left_device/page/component/keypad_button.dart';
import 'package:left_device/page/template/component/template_widget.dart';
import 'package:left_device/provider/presentation_providers.dart';
import 'package:left_device/repository/button_repository.dart';
import 'package:left_device/repository/template_repository.dart';
import 'package:left_device/util/constant/custom_button.dart';
import 'package:left_device/util/constant/text_style_constant.dart';
import 'package:left_device/util/enum/action.dart';
import 'package:left_device/util/enum/template.dart';

class TemplatePage extends ConsumerStatefulWidget {
  const TemplatePage({super.key, required this.isPro});

  final bool isPro;

  @override
  ConsumerState<TemplatePage> createState() => _PageState();
}

class _PageState extends ConsumerState<TemplatePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.isPro) {
        ref
            .read(selectedTemplateTypeProvider.notifier)
            .update((_) => TemplateEnum.numeric_4);
      }
      Map<int, ButtonEntity> tmpButtonMap = {};
      const selectedType = TemplateEnum.numericLeftBottom;
      for (int i = 1; i <= selectedType.row * selectedType.column; i++) {
        tmpButtonMap.addAll(({
          i: const ButtonEntity(
            label: '',
            isVisible: true,
            color: Colors.grey,
            action: ActionEntity(
              type: ActionTypeEnum.none,
              windowsValue: '',
              macValue: '',
            ),
          ),
        }));
        if (!widget.isPro) {
          tmpButtonMap[2] = const ButtonEntity(
            id: -1,
            label: '広告',
            action: ActionEntity(
              type: ActionTypeEnum.none,
              windowsValue: '',
              macValue: '',
            ),
            isVisible: true,
          );
        }
      }
      ref.read(buttonMapProvider.notifier).set(tmpButtonMap);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final buttons = ref.watch(buttonStreamProvider);
    final buttonMap = ref.watch(buttonMapProvider);
    final selectedType = ref.watch(selectedTemplateTypeProvider);
    final controller = ScrollController();
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Column(
            children: [
              TemplateWidget(
                templateEntity: TemplateEntity(
                  name: 'name',
                  buttonMap: buttonMap,
                  type: selectedType,
                  isVisible: true,
                ),
              ),
              const SizedBox(height: 8),
              Column(
                children: [
                  DropdownMenu<TemplateEnum>(
                    initialSelection: widget.isPro
                        ? TemplateEnum.numeric_4
                        : TemplateEnum.numericLeftBottom,
                    requestFocusOnTap: false,
                    label: const Text('タイプ'),
                    onSelected: (value) {
                      setState(() {
                        if (value != null) {
                          ref
                              .read(selectedTemplateTypeProvider.notifier)
                              .update((_) => value);
                          Map<int, ButtonEntity> tmpButtonMap = {};
                          for (int i = 1; i <= value.row * value.column; i++) {
                            tmpButtonMap.addAll(({
                              i: const ButtonEntity(
                                label: '',
                                isVisible: true,
                                color: Colors.grey,
                                action: ActionEntity(
                                  type: ActionTypeEnum.none,
                                  windowsValue: '',
                                  macValue: '',
                                ),
                              ),
                            }));
                          }
                          if (value.adPosition != null) {
                            tmpButtonMap[value.adPosition!] =
                                const ButtonEntity(
                              id: -1,
                              label: '広告',
                              action: ActionEntity(
                                type: ActionTypeEnum.none,
                                windowsValue: '',
                                macValue: '',
                              ),
                              isVisible: true,
                            );
                          }
                          ref
                              .read(buttonMapProvider.notifier)
                              .set(tmpButtonMap);
                        }
                      });
                    },
                    dropdownMenuEntries: widget.isPro
                        ? TemplateEnum.values
                            .where((e) => e.adPosition == null)
                            .map((e) {
                            return DropdownMenuEntry<TemplateEnum>(
                              value: e,
                              label: e.name,
                            );
                          }).toList()
                        : TemplateEnum.values
                            .where((e) => e.adPosition != null)
                            .map((e) {
                            return DropdownMenuEntry<TemplateEnum>(
                              value: e,
                              label: e.name,
                            );
                          }).toList(),
                  ),
                ],
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'ボタン',
                      style: TextStyleConstant.normal18,
                    ),
                  ),
                  IconButton(
                    onPressed: () => context.push('/button'),
                    icon: const Icon(
                      Icons.add,
                      size: 28,
                    ),
                  )
                ],
              ),
              buttons.when(
                data: (data) {
                  if (data.isEmpty) {
                    return const SizedBox.shrink();
                  }
                  return Expanded(
                    child: Scrollbar(
                      thumbVisibility: true,
                      interactive: true,
                      thickness: 10,
                      radius: const Radius.circular(2),
                      controller: controller,
                      child: GridView.count(
                        controller: controller,
                        primary: false,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 3,
                        children: data
                            .map((e) => _DisplayButton(buttonEntity: e))
                            .toList()
                            .where((e) => e.buttonEntity.isVisible == true)
                            .toList(),
                      ),
                    ),
                  );
                },
                error: (_, __) => const SizedBox.shrink(),
                loading: () => const Center(child: CircularProgressIndicator()),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    onPressed: () async {
                      final TextEditingController controller0 =
                          TextEditingController();
                      controller0.text =
                          selectedType.type == 'normal' ? 'ノーマル' : 'テンキー';
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text(
                              'テンプレートの名前',
                              style: TextStyleConstant.bold18,
                            ),
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
                                child: const Text('作成'),
                                onPressed: () async {
                                  final templateEntity = TemplateEntity(
                                    name: controller0.text,
                                    buttonMap: buttonMap,
                                    type: selectedType,
                                    isVisible: true,
                                  );
                                  await ref
                                      .read(templateRepositoryProvider)
                                      .addTemplate(templateEntity);
                                  ref.invalidate(templatesProvider);
                                  context.go('/');
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    text: 'OK',
                  ),
                  const SizedBox(height: 24),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _DisplayButton extends ConsumerWidget {
  const _DisplayButton({
    super.key,
    required this.buttonEntity,
  });

  final ButtonEntity buttonEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Draggable<ButtonEntity>(
      data: buttonEntity,
      feedback: SizedBox(
        height: 84,
        width: 84,
        child: KeypadButtonDesign(buttonEntity: buttonEntity),
      ),
      childWhenDragging: SizedBox(
        width: 48,
        height: 48,
        child: KeypadButtonDesign(
          buttonEntity: buttonEntity,
        ),
      ),
      child: Stack(
        children: [
          KeypadButtonDesign(buttonEntity: buttonEntity),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: GestureDetector(
                onTap: () async {
                  await ref
                      .read(buttonRepositoryProvider)
                      .removeButton(buttonEntity);
                },
                child: const Icon(
                  Icons.close_rounded,
                  size: 28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
