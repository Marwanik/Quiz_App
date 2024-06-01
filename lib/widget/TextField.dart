import 'package:flutter/material.dart';
import 'package:quizfullapp/design/String.dart';
import 'package:quizfullapp/design/Text.dart';
import 'package:quizfullapp/design/color.dart';

class TextFieldLogin extends StatelessWidget {
  TextFieldLogin({
    super.key,
    required this.Controller, required this.Icons,required this.hinttext,
  });


  final TextEditingController Controller;
  final IconData Icons;
  final String hinttext;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: Controller,
      style: TextFieldStyle,
      decoration: InputDecoration(
        prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 15),
            child: Icon(Icons, color: DarkColor)),
        hintText: hinttext,
        contentPadding: EdgeInsets.symmetric(vertical: 15.0),
        hintStyle: HintTextFiled,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: DarkColor,
            width: 2.0,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: DarkColor,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
