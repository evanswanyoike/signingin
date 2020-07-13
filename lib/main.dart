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

/*
class SignInUp extends StatefulWidget {
  @override
  _SignInUpState createState() => _SignInUpState();
}

class _SignInUpState extends State<SignInUp> {
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey,
                prefixIcon: Icon(Icons.email),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Enter your email address'),
            onChanged: (emailValue) {
              email = emailValue;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: TextField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey,
                prefixIcon: Icon(Icons.remove_red_eye),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Enter your password'),
            onChanged: (passwordValue) {
              password = passwordValue;
            },
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        'Sign in',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  onPressed: () {
                    authHandler
                        .handleSignInEmail(email, password)
                        .then((FirebaseUser user) {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new LandingPage()));
                    }).catchError((e) => print(e));
                  }),
              FlatButton(
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        'Sign up',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  onPressed: () {
                    authHandler
                        .handleSignUp(email, password)
                        .then((FirebaseUser user) {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new LandingPage()));
                    }).catchError((e) => print(e));
                  }
                  ),
            ],
          ),
        ),
      ],
    );
  }
}

*/
