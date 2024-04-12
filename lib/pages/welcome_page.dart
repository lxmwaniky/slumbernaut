import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/background.jpg'),
            fit: BoxFit.cover, // Adjust how the image fits the container
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Text(
                'SLUMBERNAUT',
                style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.white,),
              ),
              Text(
                'Your personal sleep tracker app',
                style: GoogleFonts.roboto(fontSize: 15, color: Colors.white,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
