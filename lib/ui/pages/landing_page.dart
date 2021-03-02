import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_tracker/services/authentication.dart';
import 'package:flutter_time_tracker/ui/pages/home_page.dart';
import 'package:flutter_time_tracker/ui/pages/sign_in/sign_in_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key key, @override this.authBase}) : super(key: key);

  final AuthBase authBase;

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User _user;

  @override
  void initState() {
    super.initState();
    _updateUser(widget.authBase.currentUser);
  }

  void _updateUser(User user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SignInPage(
        authBase: widget.authBase,
        onSignIn: _updateUser,
      );
    }
    return HomePage(
      authBase: widget.authBase,
      onSignOut: () => _updateUser(null),
    );
  }
}
