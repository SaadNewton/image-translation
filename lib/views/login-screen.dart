import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_translation/controller/login-controller.dart';
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
          body: Center(
            child: InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TabScreen()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(20)
                ),
                margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
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
        );
      }
    );
  }
}
