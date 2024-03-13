import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../views/home-screen.dart';
import '../views/profile-sccreen.dart';

class TabBarController extends Cubit{
  TabBarController() : super(0);
  int selectedIndex = 0;
  PageController controller = PageController();
  List<Widget> widgetList = <Widget>[
    HomeScreen(),
    ProfileScreen()
    // ProfilePage(),
    // SettingPage()
  ];

  AnimatedContainer buildBottom() {
    return AnimatedContainer(
        alignment: Alignment.center,
        duration: const Duration(seconds: 5),
        curve: Curves.easeIn,
        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 8.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  selectedIndex = 0;
                  controller.jumpTo(0);
                  emit(selectedIndex);
                  // update();
                },
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.elasticOut,
                      top: 1,
                      right: 0,
                      left: 0,
                      bottom: selectedIndex == 0 ? 0 : -100.h,
                      child: selectedIndex == 0
                          ? Center(
                          child: Container())
                          : SizedBox(),
                    ),
                    Center(
                      child: Container(
                        height: 70.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.home,color: selectedIndex == 0
                                ? Colors.amber
                                : Colors.grey,size: 24.w,),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text(
                              'Home',
                              style: TextStyle(
                                  color: selectedIndex == 0
                                      ? Colors.amber
                                      : Colors.grey,
                                  fontFamily: 'Lexend',
                                  fontSize: 12.sp),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  selectedIndex = 1;
                  controller.jumpToPage(1);
                  emit(selectedIndex);
                  // update();
                },
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.elasticOut,
                      top: 1,
                      right: 0,
                      left: 0,
                      bottom: selectedIndex == 1 ? 0 : -100.h,
                      child: selectedIndex == 1
                          ? Center(
                          child: Container())
                          : SizedBox(),
                    ),
                    Center(
                      child: Container(
                        height: 70.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person,color: selectedIndex == 1
                                ? Colors.amber
                                : Colors.grey,size: 24.w,),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              'Profile',
                              style: TextStyle(
                                  color: selectedIndex == 1
                                      ? Colors.amber
                                      : Colors.grey,
                                  fontFamily: 'Lexend',
                                  fontSize: 12.sp),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}