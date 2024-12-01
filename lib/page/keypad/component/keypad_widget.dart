import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:left_device/ignore/ad/banner_ad.dart';
import 'package:left_device/ignore/c.dart';
import 'package:left_device/model/entity/action/action_entity.dart';
import 'package:left_device/model/entity/button/button_entity.dart';
import 'package:left_device/model/entity/template/template_entity.dart';
import 'package:left_device/page/component/keypad_button.dart';
import 'package:left_device/page/keypad/component/numeric_keypad.dart';
import 'package:left_device/provider/presentation_providers.dart';
import 'package:left_device/util/enum/action.dart';
import 'package:left_device/util/enum/template.dart';
import 'package:left_device/util/send_data.dart';

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

class NumericKeypad extends StatelessWidget {
  const NumericKeypad({super.key, required this.templateEntity});

  final TemplateEntity templateEntity;

  @override
  Widget build(BuildContext context) {
    Map<int, ButtonEntity> buttons = Map.from(templateEntity.buttonMap);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () => context.pushReplacement('/'),
          icon: const Icon(Icons.arrow_back),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children:
                      List.generate(templateEntity.type.leftButtonNum, (i) {
                    int index = i + 1;
                    return _CustomButton(
                      buttonEntity: buttons[index] ?? noneButtonEntity,
                      templateEnum: templateEntity.type,
                    );
                  }),
                ),
              ),
              const NumericKeypadWidget(),
              Expanded(
                child: Column(
                  children:
                      List.generate(templateEntity.type.leftButtonNum, (i) {
                    int index = i + 1 + templateEntity.type.leftButtonNum;
                    return _CustomButton(
                      buttonEntity: buttons[index] ?? noneButtonEntity,
                      templateEnum: templateEntity.type,
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NormalKeypad extends StatelessWidget {
  const NormalKeypad({super.key, required this.templateEntity});

  final TemplateEntity templateEntity;

  @override
  Widget build(BuildContext context) {
    Map<int, ButtonEntity> buttons = Map.from(templateEntity.buttonMap);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () => context.pushReplacement('/'),
          icon: const Icon(Icons.arrow_back),
        ),
        Expanded(
          child: Row(
            children: List.generate(templateEntity.type.row, (rowIndex) {
              return Expanded(
                child: Column(
                  children:
                      List.generate(templateEntity.type.column, (columnIndex) {
                    final index =
                        rowIndex * templateEntity.type.column + columnIndex + 1;
                    if (index > buttons.length) {
                      return Expanded(child: Container());
                    }
                    return _CustomButton(
                      buttonEntity: buttons[index] ?? noneButtonEntity,
                      templateEnum: templateEntity.type,
                    );
                  }),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

class _CustomButton extends ConsumerWidget {
  const _CustomButton({
    super.key,
    required this.buttonEntity,
    required this.templateEnum,
  });

  final ButtonEntity buttonEntity;
  final TemplateEnum templateEnum;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (buttonEntity.id == -1) {
      return _AdButton(templateEnum: templateEnum);
    }
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: InkWell(
            onTap: () {
              final isWindows = ref.read(isWindowsProvider);
              final isBlue = ref.read(isBluetoothProvider);
              final service = ref.read(serviceProvider);
              print(buttonEntity.action);
              if (isBlue) {
                if (service == null) {
                  print('null');
                  return;
                }
                final c = service.characteristics[0];
                if (c.uuid.str == BLUETOOTH_CHARACTERISTIC_WINDOWS_UUID) {
                  sendBlueWindowsData(service, buttonEntity.action);
                } else if (c.uuid.str == BLUETOOTH_CHARACTERISTIC_MAC_UUID) {
                  sendBlueMacData(service, buttonEntity.action);
                }
                return;
              }

              if (isWindows) {
                sendWindowsData(buttonEntity.action, ref);
              } else {
                sendMacData(buttonEntity.action, ref);
              }
            },
            child: KeypadButtonDesign(buttonEntity: buttonEntity)),
      ),
    );
  }
}

class _AdButton extends StatelessWidget {
  const _AdButton({super.key, required this.templateEnum});

  final TemplateEnum templateEnum;

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final mediaHeight = MediaQuery.of(context).size.height;
    final screenWidth = mediaWidth > mediaHeight ? mediaWidth : mediaHeight;
    final screenHeight = mediaWidth > mediaHeight ? mediaHeight : mediaWidth;
    final width = templateEnum.type == 'normal'
        ? (screenWidth - 160) / 3
        : (screenWidth - 160) / 4;
    return BannerAdWidget(
      width: width,
      height: screenHeight / 2,
    );
  }
}
