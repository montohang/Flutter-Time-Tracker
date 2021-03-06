import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_tracker/services/authentication.dart';
import 'package:flutter_time_tracker/ui/pages/sign_in/sign_in_button.dart';
import 'package:flutter_time_tracker/ui/pages/sign_in/social_sign_in_button.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key key, @required this.onSignIn, @override this.authBase})
      : super(key: key);

  final AuthBase authBase;
  final void Function(User) onSignIn;

  Future<void> _signInAnonymously() async {
    try {
      final user = await authBase.signInAnonymously();
      onSignIn(user);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
        elevation: 2.0,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[200],
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Sign in',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 40.0),
          SocialSignInButton(
            assetName: 'assets/images/google-logo.png',
            text: 'Sign in with Google',
            textColor: Colors.black,
            color: Colors.white,
            onPressed: () {},
          ),
          SizedBox(height: 8.0),
          SocialSignInButton(
            assetName: 'assets/images/facebook-logo.png',
            text: 'Sign in with Facebook',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onPressed: () {},
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: 'Sign in with Email',
            textColor: Colors.white,
            color: Colors.teal[700],
            onPressed: () {},
          ),
          SizedBox(height: 8.0),
          Text(
            'or',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: 'Go anonymous',
            textColor: Colors.black,
            color: Colors.lime[300],
            onPressed: _signInAnonymously,
          ),
        ],
      ),
    );
  }

  void _signInWithGoogle() {
    // TODO: Auth with Google
  }
}
