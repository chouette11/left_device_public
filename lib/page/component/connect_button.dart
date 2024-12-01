import 'package:easy_loading_button/easy_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:left_device/util/constant/color_constant.dart';
import 'package:left_device/util/constant/text_style_constant.dart';

class ConnectButton extends StatelessWidget {
  const ConnectButton({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return EasyButton(
      type: EasyButtonType.outlined,
      idleStateWidget: const Text(
        '接続',
        style: TextStyleConstant.bold14,
      ),
      loadingStateWidget: const CircularProgressIndicator(
        strokeWidth: 3.0,
        valueColor: AlwaysStoppedAnimation<Color>(
          Colors.black87,
        ),
      ),
      useWidthAnimation: true,
      useEqualLoadingStateWidgetDimension: true,
      width: 100.0,
      height: 40.0,
      borderRadius: 4.0,
      elevation: 0.0,
      contentGap: 6.0,
      buttonColor: ColorConstant.black10,
      onPressed: onPressed,
    );
  }
}
