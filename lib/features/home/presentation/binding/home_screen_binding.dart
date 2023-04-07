import 'package:flutter_clean_architecture_pattren/features/home/data/datasource/home_data_source.dart';
import 'package:flutter_clean_architecture_pattren/features/home/domain%20/repository/home_repository.dart';
import 'package:flutter_clean_architecture_pattren/features/home/domain%20/usecase/home_usecase.dart';
import 'package:flutter_clean_architecture_pattren/features/home/presentation/controller/home_screen_controller.dart';
import 'package:get/get.dart';

/*
  This class binds the HomeScreenController with the HomeScreen.
 */

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    // initializing the datasource class here.
    Get.put<HomeDataSource>(HomeDataSourceIml(Get.find()));

    // initializing the home repository class here.
    Get.put<HomePageRepository>(HomeRepositoryImp(Get.find()));

    // initalizing the use case class here.
    Get.put(GetHomePageUsecase(repository: Get.find()));

    // we are passing all the dependent classes through the class constructor. So that class should not have any hidden dependency.
    // We are initializing the HomeScreenController lazily. This means it will only get memory when it is first time used.
    Get.lazyPut(() => HomeScreenController(repository: Get.find(), getHomePageUsecase: Get.find()));
  }
}