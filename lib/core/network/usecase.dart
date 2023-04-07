
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_pattren/core/network/failure.dart';


/*
Use case is used to define the request and response model
We are using generic here,
so that a class which implements this use case,
can define their own request/response model types
 */

abstract class UseCase<T, P>{
  Future<Either<Failure?, T>> call(P params);
}

class NoParams{}