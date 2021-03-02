import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_tracker/services/authentication.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key, @required this.onSignOut, @override this.authBase})
      : super(key: key);

  final AuthBase authBase;
  final VoidCallback onSignOut;

  Future<void> _signOut() async {
    try {
      await authBase.signOut();
      onSignOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          FlatButton(
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            onPressed: _signOut,
          )
        ],
      ),
    );
  }
}
