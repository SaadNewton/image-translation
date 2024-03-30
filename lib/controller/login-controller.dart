import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_translation/views/tab-bar.dart';

class LoginController extends Cubit{
  LoginController() : super(0);
  GoogleSignIn googleSignIn = GoogleSignIn(
    clientId: '866971099712-ua541m4epenl3pjvktj6uc8h4b66v0ah.apps.googleusercontent.com'
  );

  Future<void> signIn(context) async {
    try {
      // await googleSignIn.signIn();
      // print('user credentials are ${googleSignIn.currentUser}');

      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
        final String accessToken = googleSignInAuthentication.accessToken!;
        print('Access Token: $accessToken');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TabScreen()),
        );
      }


    } catch (error) {
      print("Error while sign In ${error}");
    }
  }



}