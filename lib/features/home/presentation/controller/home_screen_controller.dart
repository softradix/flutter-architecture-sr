import 'package:flutter_clean_architecture_pattren/core/network/usecase.dart';
import 'package:flutter_clean_architecture_pattren/features/home/data/datamodels/product_model.dart';
import 'package:flutter_clean_architecture_pattren/features/home/domain%20/repository/home_repository.dart';
import 'package:flutter_clean_architecture_pattren/features/home/domain%20/usecase/home_usecase.dart';
import 'package:get/get.dart';


/*
  This class represents the functionality part for HomeScreen.
  Every functionality & variables goes in this class.
  We are passing HomeScreenController here through the HomeScreenBinding, at the time of named routing.
  Using bindings, we are actually binding the lifetime of the HomeScreenController by the lifetime of HomeScreen.
  It means, when HomeScreen removed from routing stack, HomeScreenController automatically disposed with it.
 */

class HomeScreenController extends GetxController {
  final HomePageRepository repository;
  final GetHomePageUsecase getHomePageUsecase;

  /* We are passing instances of repository and use case through constructor. So that their life time is binds
   with the lifetime of HomeScreen. This technique also helps to remove all the hidden dependencies from the class. */
  HomeScreenController({
    required this.repository,
    required this.getHomePageUsecase,
  });


  // Declaration and initialization of helping variables
  RxList<ProductList> productList = <ProductList>[].obs;
  RxBool showLoader = false.obs;


  // This method will be called when HomeScreenController will be initialised first time.
  @override
  void onInit() {
    super.onInit();
    getProductListFromAPI();
  }

  // This method is used to get the product list from server by making API call.
  void getProductListFromAPI() async {
    showLoader.value = true;
    getHomePageUsecase(NoParams()).then((response) => response.fold((fail) {
          showLoader.value = false;
          print("failure<<<<<<${fail?.message}");
        }, (success) {
          showLoader.value = false;
          productList.value = success;
        }));
  }
}
