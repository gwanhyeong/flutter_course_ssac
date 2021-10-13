import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:instagram_clone/screen/tab_screen.dart';

class LoginScreen extends StatelessWidget {
  final GoogleSignIn _googleSignin = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text(
                'Instagram Clone',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                ),
              ),
              const SizedBox(
                height: 100.0,
              ),
              SignInButton(
                Buttons.Google,
                onPressed: () {
                  _handleSignIn().then((user) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TabScreen(user: user),
                        ));
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<User?> _handleSignIn() async {
    GoogleSignInAccount? googleUser = await _googleSignin.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
    UserCredential credential = await _auth.signInWithCredential(
        GoogleAuthProvider.credential(
            idToken: googleAuth.idToken, accessToken: googleAuth.accessToken));
    return credential.user;
  }
}
