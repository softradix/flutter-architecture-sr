

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_pattren/core/routes/routes.dart';
import 'package:get/get.dart';

/*
  This class represents the functionality part for LoginScreen.
  Every functionality & variables goes in this class.
  We are passing LoginScreenController here through the LoginScreenBinding, at the time of named routing.
  Using bindings, we are actually binding the lifetime of the LoginScreenController by the lifetime of LoginScreen.
  It means, when LoginScreen removed from routing stack, LoginScreenController automatically disposed with it.
 */

class LoginScreenController extends GetxController{

  // Declaration and initialization of helping variables
  var topPadding = MediaQuery.of(Get.context!).padding.top;

  // Declaration and initialization of text field controllers
  TextEditingController passwordController=TextEditingController();
  TextEditingController emailController=TextEditingController();

  // Declaration and initialization of text field focus nodes
  FocusNode passwordFocusNode=FocusNode();

  // Login button action
  onPressSignInButton(){
    Get.toNamed(Routes.homeScreen);
  }

  // Reset my password button action
  onPressResetMyPasswordButton(){
  }
}