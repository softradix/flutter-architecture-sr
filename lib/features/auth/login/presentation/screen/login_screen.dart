import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_pattren/core/theme/color_style/app_color_palette.dart';
import 'package:flutter_clean_architecture_pattren/features/auth/login/presentation/controller/login_screen_controller.dart';
import 'package:flutter_clean_architecture_pattren/features/auth/login/presentation/extension/login_screen_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/*
  This class represents the ui part for LoginScreen.
  We are passing LoginScreenController here through the LoginScreenBinding, at the time of named routing.
  Using bindings, we are actually binding the lifetime of the LoginScreenController by the lifetime of LoginScreen.
  It means, when LoginScreen removed from routing stack, LoginScreenController automatically disposed with it.
 */

class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen({Key? key})
      : super(key: key);

  // This method returns the UI for LoginScreen
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: lightColorPalette.primarySwatch.shade900,
      body: SingleChildScrollView(
        child: Container(
          height: 1.sh - controller.topPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40.h,),

                  // appBarView is defined inside the LoginScreenExtension
                  appBarView(context),
                  SizedBox(height: 240.h - (controller.topPadding + 28.h)),

                  // AssetWidget is defined inside the core/image_assets/asset_widget
                  logoView(),
                  SizedBox(height: 47.14.h),

                  // emailTextField is defined inside the LoginScreenExtension
                  emailTextField(),
                  SizedBox(height: 25.h),

                  // passwordTextField is defined inside the LoginScreenExtension
                  passwordTextField(),
                ],
              ),

              // nextButtonView is defined inside the LoginScreenExtension
              nextButtonView(),
            ],
          ),
        ),
      )
    );
  }


}
