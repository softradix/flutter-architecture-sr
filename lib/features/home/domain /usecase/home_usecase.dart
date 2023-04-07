

import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_pattren/core/network/failure.dart';
import 'package:flutter_clean_architecture_pattren/core/network/usecase.dart';
import 'package:flutter_clean_architecture_pattren/features/home/data/datamodels/product_model.dart';
import 'package:flutter_clean_architecture_pattren/features/home/domain%20/repository/home_repository.dart';

/*
Use Case is used for calling repository method and returning result through Controller to repository
 */
class GetHomePageUsecase
    extends UseCase<List<ProductList>, NoParams> {
  final HomePageRepository repository;

  GetHomePageUsecase({required this.repository});

  @override
  Future<Either<Failure?,List<ProductList>>> call(NoParams params) {
    // calling repository method
  return  repository.getProductData();
  }

}