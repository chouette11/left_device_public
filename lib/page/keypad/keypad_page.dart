
import 'package:go_router/go_router.dart';
import 'package:left_device/page/keypad/component/keypad_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:left_device/provider/presentation_providers.dart';

class KeypadPage extends ConsumerStatefulWidget {
  const KeypadPage({Key? key}) : super(key: key);

  @override
  ConsumerState<KeypadPage> createState() => _KeypadPageState();
}

class _KeypadPageState extends ConsumerState<KeypadPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final templateEntity = ref.watch(selectedTemplateProvider);
    final type = templateEntity!.type;
    if (type.type == 'numeric') {
      return PopScope(
        canPop: false,
        onPopInvoked: (_) {
          context.pushReplacement('/');
        },
        child: Material(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: NumericKeypad(templateEntity: templateEntity),
          ),
        ),
      );
    } else {
      return PopScope(
        canPop: false,
        onPopInvoked: (_) {
          context.pushReplacement('/');
        },
        child: Material(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: NormalKeypad(templateEntity: templateEntity),
          ),
        ),
      );
    }
  }
}


