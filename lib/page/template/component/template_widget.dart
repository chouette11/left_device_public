import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:left_device/model/entity/action/action_entity.dart';
import 'package:left_device/model/entity/button/button_entity.dart';
import 'package:left_device/model/entity/template/template_entity.dart';
import 'package:left_device/page/component/keypad_button.dart';
import 'package:left_device/provider/presentation_providers.dart';
import 'package:left_device/util/constant/text_style_constant.dart';
import 'package:left_device/util/enum/action.dart';

const noneButtonEntity = ButtonEntity(
  label: '',
  isVisible: true,
  color: Colors.grey,
  action: ActionEntity(
    type: ActionTypeEnum.none,
    windowsValue: '',
    macValue: '',
  ),
);

class TemplateWidget extends StatelessWidget {
  const TemplateWidget({super.key, required this.templateEntity});

  final TemplateEntity templateEntity;

  @override
  Widget build(BuildContext context) {
    final type = templateEntity.type;
    if (type.type == 'numeric') {
      return SizedBox(
        height: 240,
        width: MediaQuery.of(context).size.width,
        child: NumericTemplate(templateEntity: templateEntity),
      );
    } else {
      return SizedBox(
        height: 240,
        width: MediaQuery.of(context).size.width,
        child: NormalTemplate(templateEntity: templateEntity),
      );
    }
  }
}

class NumericTemplate extends StatelessWidget {
  const NumericTemplate({super.key, required this.templateEntity});

  final TemplateEntity templateEntity;

  @override
  Widget build(BuildContext context) {
    Map<int, ButtonEntity> buttons = Map.from(templateEntity.buttonMap);
    return Row(
      children: [
        Expanded(
          child: Column(
            children: List.generate(templateEntity.type.leftButtonNum, (i) {
              int index = i + 1;
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: _TargetButton(
                    id: index,
                    buttonEntity: buttons[index] ?? noneButtonEntity,
                  ),
                ),
              );
            }),
          ),
        ),
        const _NumericKeypadWidget(),
        Expanded(
          child: Column(
            children: List.generate(templateEntity.type.leftButtonNum, (i) {
              int index = i + 1 + templateEntity.type.leftButtonNum;
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: _TargetButton(
                    id: index,
                    buttonEntity: buttons[index] ?? noneButtonEntity,
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

class NormalTemplate extends StatelessWidget {
  const NormalTemplate({super.key, required this.templateEntity});

  final TemplateEntity templateEntity;

  @override
  Widget build(BuildContext context) {
    Map<int, ButtonEntity> buttons = Map.from(templateEntity.buttonMap);

    return Row(
      children: List.generate(templateEntity.type.row, (rowIndex) {
        return Expanded(
          child: Column(
            children: List.generate(templateEntity.type.column, (columnIndex) {
              final index =
                  rowIndex * templateEntity.type.column + columnIndex + 1;
              if (index > buttons.length) {
                return Expanded(child: Container());
              }
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: _TargetButton(
                    id: index,
                    buttonEntity: buttons[index] ?? noneButtonEntity,
                  ),
                ),
              );
            }),
          ),
        );
      }),
    );
  }
}

class _TargetButton extends ConsumerStatefulWidget {
  const _TargetButton({
    super.key,
    required this.id,
    required this.buttonEntity,
  });

  final int id;
  final ButtonEntity buttonEntity;

  @override
  ConsumerState<_TargetButton> createState() => _TargetButtonState();
}

class _TargetButtonState extends ConsumerState<_TargetButton> {
  late ButtonEntity buttonEntity;

  @override
  void initState() {
    buttonEntity = widget.buttonEntity;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant _TargetButton oldWidget) {
    buttonEntity = widget.buttonEntity;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget<ButtonEntity>(
      builder: (
        BuildContext context,
        List<dynamic> accepted,
        List<dynamic> rejected,
      ) {
        if (buttonEntity.id == -1) {
          return _AdButton(buttonEntity: buttonEntity);
        }
        return KeypadButtonDesign(buttonEntity: buttonEntity);
      },
      onAcceptWithDetails: (DragTargetDetails<ButtonEntity> details) {
        if (buttonEntity.id == -1) {
          return;
        }
        ref.read(buttonMapProvider.notifier).update(widget.id, details.data);
        setState(() {
          buttonEntity = details.data;
        });
      },
    );
  }
}

class _AdButton extends StatelessWidget {
  const _AdButton({super.key, required this.buttonEntity});

  final ButtonEntity buttonEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/billing');
      },
      child: Card(
        color: buttonEntity.color,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                buttonEntity.label,
                style: TextStyleConstant.bold16,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  '広告を消す',
                  style: TextStyleConstant.normal14.copyWith(
                    color: Colors.blueAccent,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blueAccent,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _NumericKeypadWidget extends StatelessWidget {
  const _NumericKeypadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = 24.0;
    return Table(
      columnWidths: <int, TableColumnWidth>{
        0: FixedColumnWidth(size),
        1: FixedColumnWidth(size),
        2: FixedColumnWidth(size),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          children: [
            _KeyWidget('-', size),
            _KeyWidget('+', size),
            _KeyWidget('=', size),
          ],
        ),
        TableRow(
          children: [
            _KeyWidget('7', size),
            _KeyWidget('8', size),
            _KeyWidget('9', size),
          ],
        ),
        TableRow(
          children: [
            _KeyWidget('4', size),
            _KeyWidget('5', size),
            _KeyWidget('6', size),
          ],
        ),
        TableRow(
          children: [
            _KeyWidget('1', size),
            _KeyWidget('2', size),
            _KeyWidget('3', size),
          ],
        ),
        TableRow(
          children: [
            _KeyWidget('0', size),
            _KeyWidget('.', size),
            _BackSpaceKeyWidget(size: size)
          ],
        ),
      ],
    );
  }
}

class _KeyWidget extends ConsumerWidget {
  const _KeyWidget(this.value, this.size, {super.key});

  final String value;
  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: size,
      child: Card(
        child: Center(
          child: Text(value),
        ),
      ),
    );
  }
}

class _BackSpaceKeyWidget extends ConsumerWidget {
  const _BackSpaceKeyWidget({
    super.key,
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const action = ActionEntity(
      type: ActionTypeEnum.hotkey,
      windowsValue: 'backspace',
      macValue: 'delete',
    );
    return SizedBox(
      height: size,
      child: const Card(
        child: Center(
            child: Icon(Icons.backspace_outlined, size: 8,)
        ),
      ),
    );
  }
}
