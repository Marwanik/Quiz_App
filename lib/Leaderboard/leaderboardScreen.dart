import 'package:flutter/material.dart';
import 'package:quizfullapp/Login/LoginScreen.dart';
import 'package:quizfullapp/config/get_it_config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quizfullapp/design/String.dart';
import 'package:quizfullapp/design/color.dart';
import 'package:quizfullapp/design/Text.dart';

class leaderBoardsPage extends StatelessWidget {
  const leaderBoardsPage({super.key, }); // Fix super.key to Key key

  // Method to save user data
  Future<void> _saveUserData(String userName, int points) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Save user data
    await prefs.setString('userName', userName);
    await prefs.setInt('points', points);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: DarkColor,
        body: Stack(
          children: [
            // Your existing code...
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
              top: 20,
              right: 30,
              child: Container(
                decoration: BoxDecoration(color: DarkColor, shape: BoxShape.circle),
                child: IconButton(
                  icon: Icon(
                    Icons.logout,
                    color: GradientSec,
                    size: 30,
                  ),
                  onPressed: () async {
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
            ),
            Positioned(
              top: 300,
              left: 100,
              child: Column(
                children: [
                  Text("data"), // Display user data here
                  Container(
                    height: 200,
                    width: 73,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                      color: Colors.white38,
                    ),
                    child: Center(
                      child: Text("140 pt"), // Display points here
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 225,
              left: 178,
              child: Column(
                children: [
                  Text("data"), // Display user data here
                  Container(
                    height: 250,
                    width: 73,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                      color: Colors.white38,
                    ),
                    child: Center(
                      child: Text("140 pt"), // Display points here
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 350,
              right: 82.5,
              child: Column(
                children: [
                  Text("data"), // Display user data here
                  Container(
                    height: 150,
                    width: 73,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                      color: Colors.white38,
                    ),
                    child: Center(
                      child: Text("140 pt"), // Display points here
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 35,
                  margin: EdgeInsets.all(40), // Adjust padding as needed
                  decoration: BoxDecoration(
                    color: BackGround, // Set banner background color
                    borderRadius: BorderRadius.circular(5), // Add some rounded corners
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        TODAY,
                        style: DateTime,
                      ),
                      Container(
                        height: 35,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: LinearGradient(
                            colors: [LightColor, GradientSec],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            MONTH,
                            style: DateTime,
                          ),
                        ),
                      ),
                      Text(
                        YEAR,
                        style: DateTime,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .367),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 375,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [LightColor, GradientSec],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                      ),
                      child: ListView.builder(
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          // Fetch user data from SharedPreferences
                          String userName = 'Marwan'; // Example user name
                          int points = 140; // Example points
                          return ListTile(
                            contentPadding: EdgeInsets.only(right: 50, left: 50),
                            leading: Text(
                              "04",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            title: Row(
                              children: [
                                Container(width: 23),
                                Text(userName),
                              ],
                            ),
                            trailing: Container(
                              height: 26,
                              width: 69,
                              decoration: BoxDecoration(
                                color: BackGround,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  "$points pt", // Display points here
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
