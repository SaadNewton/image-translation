import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_translation/controller/home-controller.dart';
import 'package:image_translation/utils/app-color.dart';
import 'package:language_picker/language_picker_dropdown.dart';
import 'package:language_picker/languages.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = BlocProvider.of<HomeController>(context);
    return BlocBuilder<HomeController, dynamic>(
        bloc: homeController,
        builder: (context, dynamic) {
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
                        'Image Translator',
                        style: TextStyle(
                            fontSize: 22.sp, fontWeight: FontWeight.bold,color: AppColor.WHITE),
                      )
                    ],
                  ),
                )),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20.h,),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20.sp)
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                    child: Text('Please select an image',
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                        // color: AppColor.WHITE,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700
                    ),),
                  ),
                ),


                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                  child: Row(
                    children: [
                      Text('Select Language:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp
                      ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20.w),
                        height: 30.h,
                        width: 200.w,
                        child: LanguagePickerDropdown(
                          initialValue: Languages.english,
                            onValuePicked: (Language language) {
                              print(language.name);
                            }),
                      )
                      // homeController.showCountryList(context),

                    ],
                  ),
                )

                
              ],
            ),
          );
        });
  }
}
