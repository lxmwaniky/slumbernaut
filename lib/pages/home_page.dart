import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String user;

  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome $user'),
      ),
      body: Center(
        child: Text('Welcome $user to the Home Page!'),
      ),
    );
  }
}
