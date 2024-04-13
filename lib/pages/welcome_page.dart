import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slumbernaut/pages/home_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            // Use SingleChildScrollView to handle overflow
            child: FadeInUp(
              duration: Duration(milliseconds: 1000),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 90,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: FadeInDown(
                      duration: Duration(milliseconds: 500),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'SLUMBERNAUT',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Your personal sleep tracker app',
                            style: GoogleFonts.roboto(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.teal[400],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(150),
                        bottomLeft: Radius.circular(150),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'WELCOME SLUMBERNAUT,',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Increased padding around the text input
                            decoration: BoxDecoration(
                                color: Colors.teal[200],
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 20,
                                    offset: Offset(0, 10),
                                  ),
                                ]),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(color: Colors.white),
                                    ),
                                  ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      labelText: 'Enter your name', // Changed label to labelText
                                      border: InputBorder.none,
                                    ),
                                    onSubmitted: (name) {
                                      // Save the user's name to shared preferences
                                      saveUserName(name);
                                      // Navigate to the home page
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => HomePage(user: name)),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 50,
                              margin: EdgeInsets.symmetric(horizontal: 50),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.orange,
                              ),
                              child: Center(
                                child: FadeIn( // Added a subtle fade-in animation
                                  child: Text(
                                    'Proceed',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> saveUserName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
  }
}
