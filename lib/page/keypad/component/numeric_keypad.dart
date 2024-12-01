import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:left_device/ignore/c.dart';
import 'package:left_device/model/entity/action/action_entity.dart';
import 'package:left_device/provider/presentation_providers.dart';
import 'package:left_device/util/constant/text_style_constant.dart';
import 'package:left_device/util/enum/action.dart';
import 'package:left_device/util/send_data.dart';

class NumericKeypadWidget extends StatelessWidget {
  const NumericKeypadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = (MediaQuery.of(context).size.height - 24) / 5;
    return Table(
      columnWidths: <int, TableColumnWidth>{
        0: FixedColumnWidth(size + 64),
        1: FixedColumnWidth(size + 64),
        2: FixedColumnWidth(size + 64),
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
    final action = ActionEntity(
      type: ActionTypeEnum.typewrite,
      windowsValue: value,
      macValue: value,
    );
    return InkWell(
      onTap: () {
        final isWindows = ref.read(isWindowsProvider);
        final isBlue = ref.read(isBluetoothProvider);
        final service = ref.read(serviceProvider);
        print(action);
        if (isBlue) {
          if (service == null) {
            print('null');
            return;
          }
          final c = service.characteristics[0];
          if (c.uuid.str == BLUETOOTH_CHARACTERISTIC_WINDOWS_UUID) {
            sendBlueWindowsData(service, action);
          } else if (c.uuid.str == BLUETOOTH_CHARACTERISTIC_MAC_UUID) {
            sendBlueMacData(service, action);
          }
          return;
        }

        if (isWindows) {
          sendWindowsData(action, ref);
        } else {
          sendMacData(action, ref);
        }
      },
      child: SizedBox(
        height: size,
        child: Card(
          child: Center(
            child: Text(
              value,
              style: TextStyleConstant.normal18,
            ),
          ),
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
      windowsValue: 'back',
      macValue: 'delete',
    );
    return InkWell(
      onTap: () {
        final isWindows = ref.read(isWindowsProvider);
        final isBlue = ref.read(isBluetoothProvider);
        final service = ref.read(serviceProvider);
        print(action);
        if (isBlue) {
          if (service == null) {
            print('null');
            return;
          }
          final c = service.characteristics[0];
          if (c.uuid.str == BLUETOOTH_CHARACTERISTIC_WINDOWS_UUID) {
            sendBlueWindowsData(service, action);
          } else if (c.uuid.str == BLUETOOTH_CHARACTERISTIC_MAC_UUID) {
            sendBlueMacData(service, action);
          }
          return;
        }

        if (isWindows) {
          sendWindowsData(action, ref);
        } else {
          sendMacData(action, ref);
        }
      },
      child: SizedBox(
        height: size,
        child: const Card(
          child: Center(
            child: Icon(Icons.backspace_outlined)
          ),
        ),
      ),
    );
  }
}
