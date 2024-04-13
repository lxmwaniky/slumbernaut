import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:slumbernaut/pages/welcome_page.dart';
import 'package:slumbernaut/pages/home_page.dart';
import 'package:slumbernaut/auth/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? userName = prefs.getString('userName');

  runApp(MyApp(userName: userName));
}

class MyApp extends StatelessWidget {
  final String? userName;
  final AuthService _authService = AuthService();

  MyApp({Key? key, this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Slumbernaut',
      theme: ThemeData(
        // Define your theme
      ),
      home: AuthWrapper(
        authService: _authService,
        userName: userName,
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  final AuthService authService;
  final String? userName;

  const AuthWrapper({required this.authService, this.userName});

  @override
  Widget build(BuildContext context) {
    if (userName != null && userName!.isNotEmpty) {
      return HomePage(user: userName!); // Navigate to Home Screen if user's name is already saved
    } else {
      return WelcomePage(); // Navigate to Welcome Screen if user's name is not saved
    }
  }
}
