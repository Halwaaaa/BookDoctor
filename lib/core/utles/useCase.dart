import 'package:bookdoctor/core/errors/faliure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<T, param> {
  Future<Either<faluires, T>>? call(param p);
}
