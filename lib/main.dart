import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_pattren/core/constant_strings/multi_language_string.dart';
import 'package:flutter_clean_architecture_pattren/core/network/api_request_manager.dart';
import 'package:flutter_clean_architecture_pattren/core/network/dio_request_manager.dart';
import 'package:flutter_clean_architecture_pattren/core/routes/routes.dart';
import 'package:flutter_clean_architecture_pattren/core/theme/color_style/app_color_palette.dart';
import 'package:flutter_clean_architecture_pattren/core/constant_strings/app_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


/*
  This is a demo code structure, based on clean architecture.
  Clean architecture definitly increase our coding standards.
  Sate management technique - We are using Getx as sate management technique here.
  ScreenUtilInit - we are using this dependency to make designs responsive with respect to different screen sizes.
  Localization - This demo also include multi language support in the app.
                 So that we don't need to worry at later point, when we wants to convert it into multiple languages.
  Named Routing -  We are using named routing in this project, so that we can identify routes by their name & can navigate back & forth easily.

 */



// This is the main entry point, from where app starts running.
void main() {

  // This function calls the screen, which we want to load first.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    // Here ScreenUtilInit dependency is used to make designs responsive with respect to different screen sizes.
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {

          // We are using GetMaterialApp instead of MaterialApp, beacuse we are using Getx state management technique
          return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode: ThemeMode.dark,

              // Multi language support.
              translations: MultiLanguageString(),
              locale: const Locale('en', 'US'),
              supportedLocales: const [
                Locale('en'),
                Locale('fr',)
              ],

              // It defines named routing.
              getPages: AppPages(),

              // It defines our app global theme.
              theme: ThemeData(
                primarySwatch: Colors.blue,
                textTheme: lightTextTheme,
                fontFamily: AppConstants.rota,
              ),

                // It defines the initial route of the app, such as login screen.
                initialRoute: Routes.loginScreen,

                /* You can define your global bindings here, which will be active throughout the app life cycle.
                Here we have defined DioHttpClient, because we want to make this class active throughout the app life cycle.
                So that we can make network calls in the app from anywhere.
                 */
                initialBinding: BindingsBuilder(() {
                  Get.put<IHttpClient>(DioHttpClient());
                }
                ));
        });
  }
}

