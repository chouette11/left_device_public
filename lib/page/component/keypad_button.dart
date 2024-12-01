import 'package:flutter/material.dart';
import 'package:left_device/model/entity/button/button_entity.dart';

class KeypadButtonDesign extends StatelessWidget {
  const KeypadButtonDesign({super.key, required this.buttonEntity});

  final ButtonEntity buttonEntity;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: buttonEntity.color,
      child: Center(child: Text(buttonEntity.label)),
    );
  }
}
