import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String user;

  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/homepage_background.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
