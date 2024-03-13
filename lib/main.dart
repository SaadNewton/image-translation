import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_translation/controller/home-controller.dart';
import 'package:image_translation/views/home-screen.dart';
import 'package:image_translation/views/login-screen.dart';

import 'controller/login-controller.dart';
import 'controller/tab-controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeController()),
        BlocProvider(create: (_) => LoginController()),
        BlocProvider(create: (_) => TabBarController()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 700),
        builder: (context,_) {
          return MaterialApp(
            title: 'Image Translator',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const LoginScreen(),
          );
        }
      ),
    );
  }
}
