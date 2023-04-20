import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton(this.icon, {super.key, this.onPressed});

  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    debugPrint('build MyIconButton: $icon');
    return IconButton(
      iconSize: 40,
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.blue),
    );
  }
}
