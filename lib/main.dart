import 'package:flutter/material.dart';
import 'Authentication/auth.dart';
import 'pages/loginHomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sign in/up demo',
      home: LoginScreen(),
    );
  }
}

var authHandler = new Auth();

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginHomePage(),
    );
  }
}

