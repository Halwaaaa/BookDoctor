import 'package:bookdoctor/core/errors/faliure.dart';
import 'package:bookdoctor/featuers/Auth/domin/Entitty/LoginEntity.dart';
import 'package:dartz/dartz.dart';

abstract class LoingRepo {
  Future<Either<faluires, bool>> SendFeaTuredLogin(EntityLogin);
}
