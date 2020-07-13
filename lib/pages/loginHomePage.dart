import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signingin/pages/first_screen.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/signingin/lib/Authentication/auth.dart';
import 'package:signingin/pages/signUpPage.dart';
import 'package:signingin/widgets/myButton.dart';
import 'package:signingin/widgets/myClippers.dart';

class LoginHomePage extends StatefulWidget {
  @override
  _LoginHomePageState createState() => _LoginHomePageState();
}

var authHandler = new Auth();

class _LoginHomePageState extends State<LoginHomePage> {
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipPath(
                clipper: WaveClipper2(),
                child: Container(
                  child: Column(),
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0x22ff3a5a), Color(0x22fe494d)])),
                ),
              ),
              ClipPath(
                clipper: WaveClipper3(),
                child: Container(
                  child: Column(),
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0x44ff3a5a), Color(0x44fe494d)])),
                ),
              ),
              ClipPath(
                clipper: WaveClipper1(),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      Icon(
                        Icons.fastfood,
                        color: Colors.white,
                        size: 60,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Practise App",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 30),
                      ),
                    ],
                  ),
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xffff3a5a), Color(0xfffe494d)])),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                onChanged: (emailValue) {
                  email = emailValue;
                },
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.deepOrange,
                decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.email,
                        color: Colors.red,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                onChanged: (passwordValue) {
                  password = passwordValue;
                },
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                cursorColor: Colors.deepOrange,
                decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.lock,
                        color: Colors.red,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  color: Color(0xffff3a5a)),
              child: FlatButton(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  onPressed: () {
                    authHandler
                        .handleSignInEmail(email, password)
                        .then((FirebaseUser user) {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new FirstScreen()));
                    }).catchError((e) => print(e));
                  }),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "FORGOT PASSWORD ?",
              style: TextStyle(
                  color: Colors.red, fontSize: 12, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Don't have an Account ? ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SignUpPage();
                  }));
                },
                child: Text("Sign Up ",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        decoration: TextDecoration.underline)),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 20),
            child: Center(
              child: Text(
                'OR',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.pink,
                ),
              ),
            ),
          ),
          SignInButton(),
        ],
      ),
    );
  }
}
