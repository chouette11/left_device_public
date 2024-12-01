import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class CustomAppbar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppbar({Key? key, this.onPressed}) : super(key: key);
  final Function(String)? onPressed;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return AppBar(
      elevation: 0.5,
    );
  }
}