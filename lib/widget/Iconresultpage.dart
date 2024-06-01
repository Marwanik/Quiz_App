import 'package:flutter/material.dart';
import 'package:quizfullapp/design/Text.dart';
import 'package:quizfullapp/design/color.dart';

class BuildButton extends StatelessWidget {
  const BuildButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.color,
    required this.onPressed, // Add onPressed callback
  }) : super(key: key);

  final IconData icon;
  final String text;
  final Color color;
  final VoidCallback onPressed; // Declare onPressed callback

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed, // Use the onPressed callback
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 24.0, color: BackGround),
            ),
            SizedBox(height: 10,),
            Text(text, style: LeaderBoards),
          ],
        ),
      ),
    );
  }
}
