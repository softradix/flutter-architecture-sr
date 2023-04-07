import 'dart:convert';
import 'package:flutter_clean_architecture_pattren/core/network/api_request_manager.dart';
import 'package:flutter_clean_architecture_pattren/core/network/base_repository.dart';
import 'package:flutter_clean_architecture_pattren/features/home/data/datamodels/product_model.dart';


/*
  Data source, as the name suggests, this datasource class is used to call the apis.
  It will interact with the base repository, to access the httpClient.
  We gonna make network call using httpClient client.

  This class Fetch the Data from Network for HomeScreen.
  We are Integrating Api here which returns data to our repository
 */

abstract class HomeDataSource {
  // This is the abstract method for get data
  Future<List<ProductList>?> getProductData();
}

class HomeDataSourceIml extends BaseRepository implements HomeDataSource {

  HomeDataSourceIml(IHttpClient httpClient,)
      : super(httpClient);
  @override



  Future<List<ProductList>> getProductData() async {
    // This method is used for getting data from server.
    // In this method we are returning List Type of data to our repository class
    var response = await httpClient.getRequest(
      path: '/products',
    );

    // Here we are converting json to our response model
    List<ProductList> productList=[];
    productList =productListFromJson(jsonEncode(response));

    return productList??[];
  }

}