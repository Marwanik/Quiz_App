import 'package:flutter/material.dart';
import 'package:quizfullapp/design/String.dart';
import 'package:quizfullapp/design/Text.dart';
import 'package:quizfullapp/design/color.dart';

class TextFieldAddQuestion extends StatelessWidget {
  TextFieldAddQuestion({
    super.key,
    required this.Controller, required this.hinttext,
  });



  final TextEditingController Controller;
  final String hinttext;

  @override
  Widget build(BuildContext context) {
    return         Container(

      decoration: BoxDecoration(
        color: AddQUestFiled,
        borderRadius: BorderRadius.all(Radius.circular(15),


        ),
      ),
      child: TextField(
        controller: Controller,
        style: AddQuestion,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 15),
          ),
          hintText: ADDQUESTION,
          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
          hintStyle: AddQuestion,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: AddQUestFiled,
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
    );
  }
}
