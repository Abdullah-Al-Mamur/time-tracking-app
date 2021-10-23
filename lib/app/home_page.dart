import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/service/auth.dart';

class HomePage extends StatelessWidget {
  final AuthBase auth;
  const HomePage({Key key, @required this.auth}) : super(key: key);

  Future<void> _signOut() async {
    try {
      await auth.signOut();
    } catch (error) {
      print(errorPropertyTextConfiguration.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Time Tracking'),
        backgroundColor: Colors.indigo,
        actions: [
          TextButton(
            child: Text(
              'Logout',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            onPressed: _signOut,
          ),
        ],
      ),
    );
  }
}
