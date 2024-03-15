import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_translation/controller/splash-controller.dart';
import 'package:image_translation/utils/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final splashController = BlocProvider.of<SplashController>(context);
    splashController.initSplash(context);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashController, dynamic>(
      bloc: SplashController(),
      builder: (context, _) {
        return Scaffold(
          body: Image.asset(
            AppImages.SPLASH,
            height: 100.sh,
            fit: BoxFit.fill,
          ),
        );
      }
    );
  }
}
