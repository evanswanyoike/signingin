import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/signingin/lib/Authentication/signin.dart';

import '../pages/first_screen.dart';

class SignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: OutlineButton(
                splashColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                highlightElevation: 0,
                borderSide: BorderSide(color: Colors.grey),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          height: 50, child: Image.asset('images/google.png')),
                      Flexible(
                        child: Text(
                          'Sign in with google',
                          //style: TextStyle(fontSize: 20),
                        ),
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
                }),
          ),
          SizedBox(width: 20),
          Expanded(
            child: OutlineButton(
                splashColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                highlightElevation: 0,
                borderSide: BorderSide(color: Colors.grey),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 50,
                        padding: EdgeInsets.all(5),
                        //width: 30,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset('images/fb.png', fit: BoxFit.cover,)),
                      ),
                      Flexible(
                        child: Text(
                          'Facebook sign in',
                          style: TextStyle(color: CupertinoColors.activeBlue),
                        ),
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
                }),
          ),
        ],
      ),
    );
  }
}
