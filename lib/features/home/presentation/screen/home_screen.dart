import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_pattren/core/common_ui/appbar/common_app_bar.dart';
import 'package:flutter_clean_architecture_pattren/core/constant_strings/string_resources.dart';
import 'package:flutter_clean_architecture_pattren/core/theme/color_style/app_color_palette.dart';
import 'package:flutter_clean_architecture_pattren/features/home/presentation/controller/home_screen_controller.dart';
import 'package:flutter_clean_architecture_pattren/features/home/presentation/extension/home_list_view_widget.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


/*
  This class represents the ui part for HomeScreen.
  We are passing HomeScreenController here through the HomeScreenBinding, at the time of named routing.
  Using bindings, we are actually binding the lifetime of the HomeScreenController by the lifetime of HomeScreen.
  It means, when HomeScreen removed from routing stack, HomeScreenController automatically disposed with it.
 */

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColorPalette.primarySwatch.shade900,

      // We are using common appbar here, which is defined in core/common_ui/appbar/common_app_bar.dart
      appBar: commonAppBar(title: StringsResources.products.tr),
      body: Obx(()=>controller.showLoader.value==false?Column(
        children: [
          SizedBox(height: 10.h,),

          // productListView is defined inside the HomeScreenExtension
          Expanded(child:  productListView())
        ],
      ):Center(child: CircularProgressIndicator())),

      // We are using CircularProgressIndicator, when we are waiting for api response.
    );
  }

}
