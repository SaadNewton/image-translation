import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_translation/views/tab-bar.dart';

class LoginController extends Cubit{
  LoginController() : super(0);
  GoogleSignIn googleSignIn = GoogleSignIn(
    clientId: '866971099712-ua541m4epenl3pjvktj6uc8h4b66v0ah.apps.googleusercontent.com'
  );

  Future<void> handleSignIn(context) async {
    try {
      await googleSignIn.signIn();
      print('user credentials are ${googleSignIn.currentUser}');

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TabScreen()),
      );
    } catch (error) {
      print("Error while sign In ${error}");
    }
  }



}