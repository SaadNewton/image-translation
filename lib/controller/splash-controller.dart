
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_translation/views/login-screen.dart';

import '../views/home-screen.dart';

class SplashController extends Cubit{
  SplashController() : super(0);


  initSplash(context) async{
    print('Splash Screen');
    Timer(
        const Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen())));
  }

}