import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_translation/controller/tab-controller.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = BlocProvider.of<TabBarController>(context);
    return BlocBuilder<TabBarController, dynamic>(
      bloc: tabController,
      builder: (context,_) {
        return Scaffold(
          bottomNavigationBar: SafeArea(
            child: Container(
              height: 80.h,
              width: 0.1.sw,
              // padding: EdgeInsets.all(10),
              // margin: EdgeInsets.symmetric(vertical: 2.h,horizontal: 2.w),
              margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 12.h),
              decoration: BoxDecoration(
                  color: Colors.amber,
                  // border: Border.all(color: AppColors.PRIMARY),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      // spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20)),
              child: tabController.buildBottom(),
            ),
          ),
          extendBody: true,
          body: PageView.builder(
              controller: tabController.controller,
              itemCount: tabController.widgetList.length,
              onPageChanged: (value) {
                tabController.selectedIndex = value;
                tabController.emit(tabController.selectedIndex);
              },
              itemBuilder: (context, index) {
                return Container(
                  child: tabController.widgetList[index],
                );
              }),
        );
      }
    );
  }
}
