import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeInUp(
                        duration: Duration(milliseconds: 1000),
                        child: Text(
                          'SLUMBERNAUT',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FadeInUp(
                        duration: Duration(milliseconds: 1300),
                        child: Text(
                          'Your personal sleep tracker app',
                          style: GoogleFonts.roboto(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.teal[400],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(70),
                      topRight: Radius.circular(70),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        FadeInUp(
                          duration: Duration(milliseconds: 1400),
                          child: Container(
                            padding: EdgeInsets.all(20),
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
                            child: Column(children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: Colors.white),
                                  ),
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: Colors.white),
                                  ),
                                ),
                                child: TextField(
                                  obscureText: true,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        FadeInUp(
                          duration: Duration(milliseconds: 1500),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FadeInUp(duration: Duration(milliseconds: 1600), child: Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.orange,
                          ),
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),),
                        SizedBox(
                          height: 20,
                        ),
                        FadeInUp(duration: Duration(milliseconds: 1700), child: Text(
                          'Or connect using',
                          style: TextStyle(color: Colors.white),
                        ),),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: FadeInUp(duration: Duration(milliseconds: 1800), child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.blue,
                                ),
                                child: Center(
                                  child: Text(
                                    'Google',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),
                            ),),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
