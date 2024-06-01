import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizfullapp/Leaderboard/leaderboardScreen.dart';
import 'package:quizfullapp/Login/LoginScreen.dart';
import 'package:quizfullapp/config/get_it_config.dart';
import 'package:quizfullapp/design/String.dart';
import 'package:quizfullapp/design/Text.dart';
import 'package:quizfullapp/design/color.dart';
import 'package:quizfullapp/widget/Iconresultpage.dart';
import 'package:quizfullapp/widget/bottomSheetWidget.dart';

class QuizResultPage extends StatelessWidget {
  const QuizResultPage({
    Key? key,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.totalQuestions,
    required this.questionsAnswered,
  }) : super(key: key);

  final int correctAnswers;
  final int wrongAnswers;
  final int totalQuestions;
  final int questionsAnswered;

  @override
  Widget build(BuildContext context) {
    double scorePercentage = (correctAnswers / totalQuestions) * 100;

    return SafeArea(
      child: Scaffold(
        backgroundColor: DarkColor,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/Result/Ellipse 16.png", // Replace with your image
              ),
            ),
            Positioned(
              top: 20,
              left: 25,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: GradientSec,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Positioned(
              right: 25,
              top: 50,
              child: Image.asset(
                "assets/Result/Ellipse 21.png", // Replace with your image
              ),
            ),
            Positioned(
              left: 40,
              top: 200,
              child: Image.asset(
                "assets/Result/Ellipse 22.png", // Replace with your image
              ),
            ),
            Positioned(
              left: 120,
              top: 90,
              child: Image.asset(
                "assets/Result/Ellipse 20.png",
              ),
            ),
            Positioned(
              left: 137.5,
              top: 107.5,
              child: Image.asset(
                "assets/Result/Ellipse 19.png",
              ),
            ),
            Positioned(
              left: 149,
              top: 119,
              child: Image.asset(
                "assets/Result/Ellipse 8.png",
              ),
            ),
            Positioned(
              left: 160,
              top: 120,
              child: Image.asset(
                "assets/Result/thunderbolt 1.png",
              ),
            ),
            Positioned(
              left: 160,
              top: 150,
              child: Column(
                children: [
                  Text(
                    YOURSCORE,
                    style: YourScore,
                  ),
                  Text(
                    "${scorePercentage.toStringAsFixed(2)}", // Dynamic score calculation
                    style: YourScore,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 150,
              left: 30,
              child: Image.asset(
                "assets/Result/Ellipse 10.png",
              ),
            ),
            Column(children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .35,
                width: MediaQuery.sizeOf(context).width * 9,
              ),
              Container(
                width: MediaQuery.sizeOf(context).width * .85,
                height: 210,
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [(LightColor), (GradientSec)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.circle,
                              size: 12,
                              color: DarkColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              ' $questionsAnswered / $totalQuestions',
                              style: ResultAllCon,
                            ),
                          ],
                        ),
                        SizedBox(width: 100),
                        Icon(
                          Icons.circle,
                          size: 12,
                          color: DarkColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '$totalQuestions', //data
                          style: ResultAllCon,
                        ),
                      ]),
                      Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            COMPLETION,
                            style: ResultBox,
                          ),
                          SizedBox(
                              width: MediaQuery.sizeOf(context).width * .2),
                          Text(
                            TOTALQUESTION,
                            style: ResultBox,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.circle,
                              size: 12,
                              color: Correct,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '$correctAnswers',
                              style: ResultCorrect,
                            ),
                          ],
                        ),
                        SizedBox(width: 130),
                        Icon(
                          Icons.circle,
                          size: 12,
                          color: WrongIcon,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '$wrongAnswers',
                          style: ResultWrong,
                        ),
                      ]),
                      Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            CORRECT,
                            style: ResultBox,
                          ),
                          SizedBox(
                              width: MediaQuery.sizeOf(context).width * .25),
                          Text(
                            WRONG,
                            style: ResultBox,
                          ),
                        ],
                      ),
                    ]),
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BuildButton(icon :Icons.replay,text:  PLAYAGAIN,color: ResultButton1,onPressed: () {Navigator.of(context).pop();}),
                  BuildButton(icon :Icons.remove_red_eye,text:  REVIEWANSWER,color:  ResultButton2,onPressed: () {  }),
                  BuildButton(icon :Icons.share,text:  SHARESCORE,color:  ResultButton3,onPressed: () {  }),
                ],
              ),
              SizedBox(height: 50,),
              Row(
                children: [
                  BuildButton(icon :Icons.picture_as_pdf,text:  GENERATEPDF,color: ResultButton4,onPressed: () {}),
                  SizedBox(width: 50,),
                  BuildButton(icon :Icons.house,text:  HOME,color:  ResultButton5,onPressed: () {}),
                  SizedBox(width: 50,),
                  BuildButton(icon :Icons.settings_suggest,text:  LEADERBOARD,color:  ResultButton6, onPressed: () {
                    final userSession = core<UserSession>();
                    userSession.logout();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  }),

                ],

              ),
            ]),
          ],
        ),
      ),
    );
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return AddQuestionBottomSheet();
    },
  );
}
