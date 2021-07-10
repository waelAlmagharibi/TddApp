import 'package:dartz/dartz.dart';
import 'package:flutter_appss/core/error/failures.dart';

abstract class UseCase<Type,Params>{
  Future<Either<Failure,Type>> call(Params param);



}