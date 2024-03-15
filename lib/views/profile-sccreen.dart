import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_translation/utils/app-color.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: Size(100.sw, 100.h),
              child: Container(
                height: 80.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.sp),
                    bottomRight: Radius.circular(20.sp),
                  ),
                  color: AppColor.SECONDARY,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Profile',
                      style: TextStyle(
                          fontSize: 22.sp, fontWeight: FontWeight.bold,color: AppColor.WHITE),
                    )
                  ],
                ),
              )),

        );
      }
    );
  }
}
