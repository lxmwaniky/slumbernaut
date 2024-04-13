import 'package:flutter/material.dart';
import 'package:slumbernaut/pages/welcome_page.dart';
import 'package:slumbernaut/pages/home_page.dart';
import 'package:slumbernaut/auth/auth_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Slumbernaut',
      theme: ThemeData(
        // Define your theme
      ),
      home: AuthWrapper(authService: _authService),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  final AuthService authService;

  const AuthWrapper({required this.authService});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: authService.checkAuthState(),
      builder: (context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          if (snapshot.data == true) {
            return WelcomePage(); // Navigate to WelcomePage if user is signed in
          } else {
            return HomePage(); // Navigate to LoginPage if user is not signed in
          }
        }
      },
    );
  }
}
