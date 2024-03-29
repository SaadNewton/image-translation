import 'package:flutter/cupertino.dart';
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
        return SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                Container(
                  width: 1.sw,
                  child: Image.asset(
                    AppImages.SPLASH_BG,
                    // width: 100.w,

                    // height: 100.sh,
                    fit: BoxFit.fill,
                  ),
                ),
                Center(
                  child: SizedBox(
                      width: 0.6.sw,
                      // height: 0.2.sh,
                      child: Image.asset(AppImages.LOGO,)),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
