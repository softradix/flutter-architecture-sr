import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_pattren/core/common_ui/button/custom_common_button.dart';
import 'package:flutter_clean_architecture_pattren/core/common_ui/button/custom_icon_button.dart';
import 'package:flutter_clean_architecture_pattren/core/common_ui/decoration/common_text_styles.dart';
import 'package:flutter_clean_architecture_pattren/core/common_ui/decoration/text_filed_decorations.dart';
import 'package:flutter_clean_architecture_pattren/core/common_ui/image_assets/asset.dart';
import 'package:flutter_clean_architecture_pattren/core/common_ui/image_assets/asset_widget.dart';
import 'package:flutter_clean_architecture_pattren/core/common_ui/textFiled/common_email_text_filed.dart';
import 'package:flutter_clean_architecture_pattren/core/common_ui/textFiled/common_password_text_filed.dart';
import 'package:flutter_clean_architecture_pattren/core/theme/color_style/app_color_palette.dart';
import 'package:flutter_clean_architecture_pattren/core/utills/image_resources.dart';
import 'package:flutter_clean_architecture_pattren/core/constant_strings/string_resources.dart';
import 'package:flutter_clean_architecture_pattren/features/auth/login/presentation/screen/login_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


/*
We make this extension over LoginScreen, so that we can reduce the no. of lines on LoginScreen.
It is always better to use extensions instead of global functions,
extensions restrict the functions to only accessible with in the defined class.
Anywhere if you feel, no of lines are exceeding in one screen, just split that class using the extension
 */

extension LoginScreenExtension on LoginScreen{

  // This function returns a widget, which builds the login screen appbar.
  Widget appBarView(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 22.w),
      child: Align(
        alignment: Alignment.centerLeft,
        child: CustomIconButton(
          padding: EdgeInsets.only(bottom: 6.h, right: 8.w, top: 6.h, left: 8.w),
          onPressed: () {},
          child: AssetWidget(
            asset: Asset(type: AssetType.svg, path: ImageResource.back_button),
            height: 16.h,
            width: 16.w,
          ),
        ),
      ),
    );
  }

  // This function returns a widget, which builds the logo image.
  Widget logoView(){
    return AssetWidget(
      asset: Asset(
          path: ImageResource.login_looch,
          type: AssetType.svg),
    );
  }

  // This function returns a widget, which builds the email input field.
  Widget emailTextField() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: CommonEmailTextFieldWidget(
          controller: controller.emailController,
            hint: '',
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            readOnly: false,
            decoration: showInputDecoration(
                StringsResources.businessEmail.tr,
                formFieldAcceptDecoration(true),
                showBorder: true,
                Get.context!),
            enabled: false,
            onChange: (email) {}));
  }

  // This function returns a widget, which builds the password input field.
  Widget passwordTextField() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: CommonPasswordTextFieldWidget(
          contentPadding: EdgeInsets.only(left: 40.w, top: 14.h, bottom: 14.h),
          onEditingComplete: () {
          },
          controller: controller.passwordController,
          node: controller.passwordFocusNode,
          hint: StringsResources.password.tr,
          keyboardType: TextInputType.visiblePassword,
          obscureText: false,
          textInputAction: TextInputAction.go,
          email: '',
          suffixIcon: IconButton(
              onPressed: () {},
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              iconSize: 24.w,
              icon: Container(
                child: AssetWidget(
                  height: 24.w,
                  width: 24.w,
                  color: Colors.white,
                  asset: Asset(path: ImageResource.eyeOpen, type: AssetType.svg),
                ),
              )),
          onChange: (String pass) {
            pass.isNotEmpty ? true : false;
          },
          showPasswordError: false,
        ));
  }

  // This function returns a widget, which build the Login & Reset my password buttons.
  Widget nextButtonView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: CommonButton(
            commonButtonBottonText: StringsResources.Signin.tr,
            onPress: () {
              controller.onPressSignInButton();
            },
            minWidth: MediaQuery.of(Get.context!).size.width,
          ),
        ),
        CupertinoButton(
            onPressed: () async {},
            child: Text(
              StringsResources.resetMyPassword.tr,
              style: SmallButtonLabel(
                  context: Get.context!,
                  color: lightColorPalette.secondarySwatch.shade900),
            )),
        SizedBox(height: 15.h),
      ],
    );
  }

}