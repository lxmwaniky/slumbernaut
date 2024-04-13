import 'package:flutter/material.dart';
import 'package:slumbernaut/pages/welcome_page.dart';

class HomePage extends StatelessWidget {
  final String user;

  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome $user'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomePage(),),);
            },
          ),],
      ),
      body: Center(
        child: Text('Welcome $user to the Home Page!'),
      ),
    );
  }
}
