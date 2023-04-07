import 'package:flutter_clean_architecture_pattren/features/auth/login/presentation/controller/login_screen_controller.dart';
import 'package:get/get.dart';

/*
  This class binds the LoginScreenController with the LoginScreen.
 */

class LoginScreenBinding extends Bindings {
  @override
  void dependencies() {

    // We are initializing the LoginScreenController lazily. This means it will only get memory when it is first time used.
    Get.lazyPut(() => LoginScreenController());
  }
}