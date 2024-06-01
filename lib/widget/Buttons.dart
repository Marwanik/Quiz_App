import 'package:flutter/material.dart';

class ButtonWithCustomTitle extends StatelessWidget {
  const ButtonWithCustomTitle({
    super.key,
    required this.title, required this.color, required this.style, required void Function() onPressed,
  });
  final String title;
  final Color color;
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(title, style: style),
      width: 317,
      height: 54,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: color),
    );
  }
}
