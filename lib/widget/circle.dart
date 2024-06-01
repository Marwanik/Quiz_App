import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quizfullapp/design/Text.dart';
import 'package:quizfullapp/design/color.dart';

class GradientCircularProgressIndicator extends StatelessWidget {
  final double percentage;
  final int number;

  const GradientCircularProgressIndicator({
    Key? key,
    required this.percentage,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(

      linearGradient: LinearGradient(
        colors: [DarkColor, DarkColor],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      radius: 30,
      lineWidth: 5.0,
      animation: true,
      percent: percentage,
      center: Text(
        '$number',
        style:Questnum
      ),
      circularStrokeCap: CircularStrokeCap.square,
      backgroundColor: Colors.transparent,


    );
  }
}