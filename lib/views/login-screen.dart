import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_translation/controller/login-controller.dart';
import 'package:image_translation/utils/app-color.dart';
import 'package:image_translation/utils/images.dart';
import 'package:image_translation/views/home-screen.dart';
import 'package:image_translation/views/tab-bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginController>(context);
    return BlocBuilder<LoginController,dynamic>(
      bloc: loginCubit,
      builder: (context, dynamic) {
        return Scaffold(
          body: Stack(
            children: [
              Container(
                width: 1.sw,
                child: Image.asset(
                  AppImages.LOGIN_BG,
                  // width: 100.w,

                  // height: 100.sh,
                  fit: BoxFit.fill,
                ),
              ),

              Positioned(
                top: 0.2.sh,
                left: 0.2.sw,
                right: 0.2.sw,
                child: SizedBox(
                    width: 0.6.sw,
                    // height: 0.2.sh,
                    child: Image.asset(AppImages.LOGO,)),
              ),

              Positioned(
                bottom: 0.3.sh,
                left: 0.16.sw,
                right: 0.16.sw,
                child: InkWell(
                  onTap: (){
                    loginCubit.handleSignIn(context);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const TabScreen()),
                    // );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.WHITE,
                      // border: Border.all(
                      //   color: Colors.grey,
                      // ),
                      borderRadius: BorderRadius.circular(30.sp)
                    ),
                    // margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    padding: EdgeInsets.symmetric(vertical: 10.sp,horizontal: 30.sp),
                    child: IntrinsicWidth(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppImages.GOOGLE_ICON,width: 20,),
                          const SizedBox(width: 20,),
                          const Text("Sign In with Google"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
