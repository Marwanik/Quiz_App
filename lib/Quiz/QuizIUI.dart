import 'dart:async' show Timer;
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizfullapp/Login/LoginScreen.dart';
import 'package:quizfullapp/Quiz/QuizAPI.dart';
import 'package:quizfullapp/Quiz/QuizModel.dart';
import 'package:quizfullapp/Result/ResultsScreen.dart';
import 'package:quizfullapp/config/get_it_config.dart';
import 'package:quizfullapp/design/Text.dart';
import 'package:quizfullapp/design/color.dart';
import 'package:quizfullapp/widget/circle.dart';
import 'package:quizfullapp/widget/bottomSheetWidget.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  int wrongAnswers = 0;
  bool showIcons = false;
  List<int> userAnswers = [];
  late List<QuizModel> quiz; // Make quiz late initialized

  @override
  void initState() {
    super.initState();
    _loadQuiz();
  }

  Future<void> _loadQuiz() async {
    try {
      final quizData = await getQuiz();
      print('Quiz data fetched successfully: $quizData');
      setState(() {
        quiz = quizData;
      });
    } catch (e) {
      print('Error loading quiz: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: DarkColor,
        body: FutureBuilder<List<QuizModel>>(
          future: getQuiz(), // Get the quiz data
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              quiz = snapshot.data!; // Assign data to quiz
              return _buildQuizWidget(quiz); // Call widget with data
            } else if (snapshot.hasError) {
              return Center(child: Text('Error loading quiz'));
            }
            // Show a loading indicator while fetching data
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
  Widget _buildQuizWidget(List<QuizModel> quiz) {

    final quizItem = quiz[currentQuestionIndex];
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: Image.asset(
            "assets/Quiz/Ellipse 12.png",
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
              final userSession = core<UserSession>();
              userSession.logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Image.asset(
            "assets/Quiz/thunderbolt 1.png",
          ),
        ),
        Positioned(
          top: 150,
          left: 30,
          child: Image.asset(
            "assets/Quiz/Ellipse 10.png",
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Image.asset(
            "assets/Quiz/thunderbolt 2.png",
          ),
        ),
        Column(
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Positioned(
                    top: 150,
                    left: 20,
                    child: Container(
                      width: MediaQuery.of(context).size.width * .9,
                      height: 200,
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [(LightColor), (GradientSec)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                correctAnswers.toString().padLeft(2, '0'),
                                style: CorrectAnswerLinear,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: LinearProgressIndicator(
                                  value: correctAnswers / quiz.length,
                                  backgroundColor: Colors.transparent,
                                  borderRadius: BorderRadius.circular(15),
                                  valueColor:
                                  AlwaysStoppedAnimation<Color>(Correct),
                                ),
                              ),
                              SizedBox(width: 250),
                              Expanded(
                                child: Transform(
                                  transform: Matrix4.rotationY(math.pi),
                                  alignment: Alignment.center,
                                  child: LinearProgressIndicator(
                                    value: wrongAnswers / quiz.length,
                                    backgroundColor: Colors.transparent,
                                    borderRadius: BorderRadius.circular(15),
                                    valueColor:
                                    AlwaysStoppedAnimation<Color>(Wrong),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                wrongAnswers.toString().padLeft(2, '0'),
                                style: WrongAnswerLinear,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Question ${currentQuestionIndex + 1}/${quiz.length}",
                            style: FullQuestions,
                          ),
                          SizedBox(height: 40),
                          Text(
                            quizItem.question,
                            style: QuestionText,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 115,
                    left: MediaQuery.of(context).size.width * .4,
                    child: Image.asset("assets/Quiz/Ellipse 5.png"),
                  ),
                  Positioned(
                    top: 118,
                    left: MediaQuery.of(context).size.width * .41,
                    child: GradientCircularProgressIndicator(
                      percentage: currentQuestionIndex / quiz.length,
                      number: currentQuestionIndex + 1,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                  itemCount: quizItem.answer.length,
                  itemBuilder: (context, index) {
                    final isCorrect = index == quizItem.indexOfCorrect;
                    final isSelected =
                        showIcons && userAnswers.last == index;

                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color:BackGround,
                          ),
                          child: ListTile(
                            title: Text(
                              quizItem.answer[index],
                              style: AnswerText,
                            ),
                            trailing: showIcons
                                ? (isCorrect || isSelected)
                                ? Icon(
                              isCorrect
                                  ? Icons.check_circle
                                  : Icons.cancel,
                              color: isCorrect
                                  ? Correct
                                  : WrongIcon,
                            )
                                : null
                                : null,
                            onTap: () => _handleAnswerTap(index, isCorrect),
                          ),
                        ),
                        if (index < 3) SizedBox(height: 30),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: FloatingActionButton(
            onPressed: () => _showBottomSheet(context),
            child: Icon(Icons.add),
          ),
        ),
      ],
    );
  }

  void _handleAnswerTap(int index, bool isCorrect) {
    if (!showIcons) {
      setState(() {
        userAnswers.add(index);
        if (isCorrect) {
          correctAnswers++;
        } else {
          wrongAnswers++;
        }
        showIcons = true;
      });

      if (currentQuestionIndex < quiz.length - 1) {
        Timer(Duration(seconds: 3), () {
          setState(() {
            currentQuestionIndex++;
            showIcons = false;
          });
        });
      } else {
        // Navigate to QuizResultPage when on last question
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => QuizResultPage(
              correctAnswers: correctAnswers,
              wrongAnswers: wrongAnswers,

              questionsAnswered: currentQuestionIndex,
              totalQuestions: currentQuestionIndex,
            ),
          ),
        );
      }
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
}
