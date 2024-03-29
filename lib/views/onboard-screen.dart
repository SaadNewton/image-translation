import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_translation/controller/onboard-controller.dart';
import 'package:image_translation/utils/app-color.dart';
import 'package:image_translation/views/login-screen.dart';

import '../utils/images.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<OnboardController>(context);
    return BlocBuilder<OnboardController, dynamic>(
        bloc: loginCubit,
        builder: (context, dynamic) {
          return Scaffold(
            body: Stack(
              children: [
                Container(
                  width: 1.sw,
                  child: Image.asset(
                    AppImages.ONBOARD_BG,
                    // width: 100.w,

                    // height: 100.sh,
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        onPageChanged: (index) {
                          loginCubit.pageIndex = index;
                          loginCubit.emit(loginCubit.pageIndex);
                        },
                        itemCount: loginCubit.onboardData.length,
                        controller: loginCubit.pageController,
                        itemBuilder: (context, index) => OnBoardContent(
                          // title: loginCubit.onboardData[index].title,
                          description:
                              loginCubit.onboardData[index].description,
                          image: loginCubit.onboardData[index].image,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                            loginCubit.onboardData.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: DotIndicator(
                                isActive: index == loginCubit.pageIndex,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (loginCubit.pageIndex == 0) {
                          loginCubit.pageController.animateToPage(1,
                              duration: Duration(milliseconds: 200),
                              curve: Curves.linear);
                        } else if (loginCubit.pageIndex == 1) {
                          loginCubit.pageController.animateToPage(2,
                              duration: Duration(milliseconds: 200),
                              curve: Curves.linear);
                        } else if (loginCubit.pageIndex == 2) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const LoginScreen()));
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColor.PRIMARY)),
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                    SizedBox(
                      height: 0.1.sh,
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }
}

// OnBoarding area widget
class OnBoardContent extends StatelessWidget {
  OnBoardContent({
    super.key,
    required this.image,
    required this.description,
  });

  String image;
  String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: 0.4.sh,
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColor.SECONDARY,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),

        // const Spacer(),
      ],
    );
  }
}

// Dot indicator widget
class DotIndicator extends StatelessWidget {
  const DotIndicator({
    this.isActive = false,
    super.key,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive ? AppColor.PRIMARY : Colors.white,
        border: isActive ? null : Border.all(color: AppColor.PRIMARY),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}
