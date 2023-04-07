



import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture_pattren/core/network/failure.dart';
import 'package:flutter_clean_architecture_pattren/features/home/data/datamodels/product_model.dart';
import 'package:flutter_clean_architecture_pattren/features/home/data/datasource/home_data_source.dart';

/*
This Class is intermediate between datasource and controller
in this we are sending data to controller via usecase
 */



abstract class HomePageRepository {
  // this is the abstract method for get data
  //Either is use for success and failure for creating Either we are using dartz package this is for error handeling technique
  Future<Either<Failure?, List<ProductList>>> getProductData();

}
class HomeRepositoryImp extends HomePageRepository {
  final HomeDataSource _homeDataSource;
  HomeRepositoryImp(this._homeDataSource);

  //in this override method we are get data from our data source
  @override
  Future<Either<Failure?, List<ProductList>>> getProductData() async{
    try {
      var result = await _homeDataSource.getProductData();

      // right is use for success
      return Right(result??[]);
    }  on DioError catch (e) {

      //left is use for failure
    return Left(GeneralFailure(e.message??"error"));
    }

  }




}