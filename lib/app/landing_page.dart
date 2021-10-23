import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/home_page.dart';
import 'package:time_tracker_flutter_course/app/service/auth.dart';
import 'package:time_tracker_flutter_course/app/sign_in/sign_in_page.dart';

class LandingPage extends StatelessWidget {
  LandingPage({@required this.auth});
  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: auth.authStateChange(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final _user = snapshot.data;
          return _user == null
              ? SignInPage(
                  auth: auth, // * also we can use just _updateUser
                )
              : HomePage(
                  auth: auth,
                );
        }
        return Scaffold(
          body: Center(
            child: const CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
