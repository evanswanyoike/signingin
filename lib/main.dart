import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:signingin/auth.dart';
import 'package:signingin/first_screen.dart';
import 'package:signingin/landingPage.dart';
import 'package:signingin/signin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(size: 150),
              SizedBox(
                height: 50,
              ),
              _signInButton(context),
              SignInUp()
            ],
          ),
        ),
      ),
    );
  }
}

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
                  }),
            ],
          ),
        ),
      ],
    );
  }
}

Widget _signInButton(BuildContext context) {
  return OutlineButton(
      splashColor: Colors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(height: 50, child: Image.asset('images/google.png')),
            Text(
              'Sign in with google',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
      onPressed: () {
        signInWithGoogle().whenComplete(
          () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return FirstScreen();
                },
              ),
            );
          },
        );
      });
}
