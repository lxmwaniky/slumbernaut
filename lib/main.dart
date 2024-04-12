import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:slumbernaut/pages/welcome_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Slumbernaut',
    home: WelcomePage(),
  ));
}
