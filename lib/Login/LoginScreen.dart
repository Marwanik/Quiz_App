
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizfullapp/Quiz/QuizIUI.dart';
import 'package:quizfullapp/config/get_it_config.dart';
import 'package:quizfullapp/design/String.dart';
import 'package:quizfullapp/design/Text.dart';
import 'package:quizfullapp/design/color.dart';
import 'package:quizfullapp/widget/TextField.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController name = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //appBar: AppBar(title: Text(core.get<SharedPreferences>().getString('name')?? ''),),
      
        body: SingleChildScrollView(
          child: Stack(
            children: [
              // Background circles
              const Positioned(
                  child: Image(
               
                      image: AssetImage(
                          "assets/Login/first.png"
                      )
                  )
              ),
              const   Positioned(
                  left: 47,
                  child: Image(
                      image: AssetImage(
                          "assets/Login/sec.png"
                      )
                  )
              ),
              const   Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image(
                      image: AssetImage(
                          "assets/Login/six.png"
                      )
                  )
              ),
              const    Positioned(
                  top: 160,
                  left: 40,
                  child: Image(
                      image: AssetImage(
                          "assets/Login/third.png"
                      )
                  )
              ),
              const     Positioned(
                  top: 45,
                  left: 250,
                  child: Image(
                      image: AssetImage(
                          "assets/Login/fourth.png"
                      )
                  )
              ),
              const  Positioned(
                  child: Image(
                      image: AssetImage(
                          "assets/Login/fifth.png"
                      ),
                  )
              ),
          
              Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 110,
          
                    ),
                    Text(
                      LOGINTITLE,
                      style: loginTitle
                    ),
                    const SizedBox(height: 250),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * .85,
          
                      child: TextFieldLogin( Controller: name, Icons: Icons.email, hinttext: USEREMAIL)),
                     SizedBox(height: 40),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * .85,
                      child: TextFieldLogin( Controller: password, Icons: Icons.lock, hinttext: PASSWORD,),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      width: MediaQuery.sizeOf(context).width * .85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                          colors: [(LightColor), (GradientSec)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          // Check if either of the text fields is empty
                          if (name.text.isEmpty || password.text.isEmpty) {
                            // Show a dialog or toast indicating that fields are required
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Error'),
                                content: Text(' email and password are required.'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            // Both fields are filled, proceed with login
                            core.get<SharedPreferences>().setString('name', name.text);
                            core.get<SharedPreferences>().setString('pass', password.text);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return QuizPage();
                                },
                              ),
                            );
                          }
                        },
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
                          LOGINBUTTON,
                          style: loginButton,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(height : MediaQuery.sizeOf(context).height)
            ],
          ),
        ),
      ),
    );
  }
}
