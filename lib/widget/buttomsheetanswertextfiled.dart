import 'package:flutter/material.dart';
import 'package:quizfullapp/design/String.dart';
import 'package:quizfullapp/design/Text.dart';
import 'package:quizfullapp/design/color.dart';

class TextFieldAddAnswer extends StatelessWidget {
  const TextFieldAddAnswer({
    super.key,
    required this.controller,
    required this.index,
    required this.isSelected,
    required this.onSelected,
  });

  final TextEditingController controller;
  final int index;
  final bool isSelected;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: BackGround,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: TextField(
                  controller: controller,
                  style: AddQuestion,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 15.0),
                    ),
                    hintText: ANSWERINDEX,
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                    hintStyle: AddQuestion,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: BackGround, // Add shade
                        width: 2.0,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: DarkColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Checkbox(
              value: isSelected,
              onChanged: (bool? value) {
                if (value == true) {
                  onSelected(index);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
