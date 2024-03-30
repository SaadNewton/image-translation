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
          backgroundColor: Colors.transparent,

          body: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 0.1.sh,),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.WHITE,
                    shape: BoxShape.circle
                  ),
                  padding: EdgeInsets.all(14.sp),
                  child: Icon(Icons.person,size: 60.sp,),
                ),
              ),
              SizedBox(height: 0.02.sh,),
              Text('Saad Saleem',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
              SizedBox(height: 0.004.sh,),
              Text('saad.sal748@gmail.com',style: TextStyle(fontSize: 14.sp),),
            ],
          ),

        );
      }
    );
  }
}
