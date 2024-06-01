import 'package:flutter/material.dart';
import 'package:quizfullapp/design/String.dart';
import 'package:quizfullapp/design/Text.dart';
import 'package:quizfullapp/design/color.dart';

import 'package:quizfullapp/widget/buttomsheetQuestiontextfield.dart';
import 'package:quizfullapp/widget/buttomsheetanswertextfiled.dart';
import 'package:dio/dio.dart';
import '../Quiz/QuizModel.dart';

class AddQuestionBottomSheet extends StatefulWidget {
  @override
  _AddQuestionBottomSheetState createState() => _AddQuestionBottomSheetState();
}

class _AddQuestionBottomSheetState extends State<AddQuestionBottomSheet> {
  TextEditingController addQuestionController = TextEditingController();
  TextEditingController addAnswer1Controller = TextEditingController();
  TextEditingController addAnswer2Controller = TextEditingController();
  TextEditingController addAnswer3Controller = TextEditingController();
  TextEditingController addAnswer4Controller = TextEditingController();
  int _correctAnswerIndex = 0;
  bool _isLoading = false;

  @override
  void dispose() {
    addQuestionController.dispose();
    addAnswer1Controller.dispose();
    addAnswer2Controller.dispose();
    addAnswer3Controller.dispose();
    addAnswer4Controller.dispose();
    super.dispose();
  }

  void _submitQuestion() async {
    if (addQuestionController.text.isEmpty ||
        addAnswer1Controller.text.isEmpty ||
        addAnswer2Controller.text.isEmpty ||
        addAnswer3Controller.text.isEmpty ||
        addAnswer4Controller.text.isEmpty) {
      // Handle empty fields
      print('Error: Empty fields encountered.');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    QuizModel newQuestion = QuizModel(
      question: addQuestionController.text,
      answer: [
        addAnswer1Controller.text,
        addAnswer2Controller.text,
        addAnswer3Controller.text,
        addAnswer4Controller.text,
      ],
      indexOfCorrect: _correctAnswerIndex,
    );

    final Map<String, dynamic> requestBody = {
      "question": newQuestion.question,
      "answer": newQuestion.answer,
      "indexOfCorrect": newQuestion.indexOfCorrect,
    };


    try {
      final dio = Dio();
      final response = await dio.post(
        "https://6654ec903c1d3b602937cdc1.mockapi.io/Quiz",
        data: requestBody,
      );

      // Print detailed response information for debugging
      print('--- POST Request Details ---');
      print('URL: ${response.requestOptions
          .uri}'); // Use requestOptions.uri instead of request.uri
      print('Method: ${response.requestOptions.method}');
      print('Headers: ${response.requestOptions.headers}');
      print('Data: $requestBody');


      if (response.statusCode == 201) {
        // Success
        print('--- POST Request Successful ---');
        print('Status Code: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Question added successfully!'),
          ),
        );
        Navigator.pop(context);
      } else {
        print('--- POST Request Failed ---');
        print('Status Code: ${response.statusCode}');
        print('Error: ${response.data}');
        throw Exception('Failed to add question');
      }
    } catch (e) {
      print('--- Error During POST Request ---');
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to add question. Please try again.'),
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _setCorrectAnswer(int index) {
    setState(() {
      _correctAnswerIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          gradient: LinearGradient(
            colors: [(LightColor), (GradientSec)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.all(30.0),
        child: Column(
            children: [
            SizedBox(height: 10.0),
        TextFieldAddQuestion(
          Controller: addQuestionController,
          hinttext: ADDQUESTION,
        ),
        SizedBox(height: 10.0),
        TextFieldAddAnswer(
          controller: addAnswer1Controller,
          index: 0,
          isSelected: _correctAnswerIndex == 0,
          onSelected: _setCorrectAnswer,
        ),
        SizedBox(height: 10.0),
        TextFieldAddAnswer(
          controller: addAnswer2Controller,
          index: 1,
          isSelected: _correctAnswerIndex == 1,
          onSelected: _setCorrectAnswer,
        ),
        SizedBox(height: 10.0),
        TextFieldAddAnswer(
          controller: addAnswer3Controller,
          index: 2,
          isSelected: _correctAnswerIndex == 2,
          onSelected: _setCorrectAnswer,
        ),
        SizedBox(height: 10.0),
        TextFieldAddAnswer(
          controller: addAnswer4Controller,
          index: 3,
          isSelected: _correctAnswerIndex == 3,
          onSelected: _setCorrectAnswer,
        ),
        SizedBox(height: 20),
        _isLoading
            ? CircularProgressIndicator()
            : Container(
          width: MediaQuery
              .sizeOf(context)
              .width * .85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
           color: DarkColor

          ), child: ElevatedButton(
          onPressed: _submitQuestion, // Call _submitQuestion here
          style: ElevatedButton.styleFrom(
            padding:
            const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Text(
            CONFORM,
            style: Conform,
          ),
        ),
        ),
          ],
        ),
      ),
    );
  }
}
