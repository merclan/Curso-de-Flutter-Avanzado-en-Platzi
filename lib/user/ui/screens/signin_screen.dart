import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:platzi_trips_app/user/bloc/bloc_user.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return signInGoogleUI();
  }

  Widget signInGoogleUI() {
    return Scaffold(
        body: Stack(alignment: Alignment.center, children: <Widget>[
      GradientBack("", null),
      Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Text("Welcome \nThis is your travel app",
            style: TextStyle(
                fontSize: 37,
                fontFamily: "Lato",
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        ButtonGreen(
            text: "Login with Gmail",
            onPressed: () {
              userBloc.signIn().then((FirebaseUser user) =>
                  print("display name: ${user.displayName}"));
            },
            width: 300.0,
            height: 50.0)
      ])
    ]));
  }
}
