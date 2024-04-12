import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('/lib/assets/images/background.jpg'),
            fit: BoxFit.cover, // Adjust how the image fits the container
          ),
        ),
        child: Center(),
      ),
    );
  }
}