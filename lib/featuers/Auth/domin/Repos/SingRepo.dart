import 'package:bookdoctor/core/errors/faliure.dart';
import 'package:bookdoctor/featuers/Auth/domin/Entitty/AsktoEntity.dart';
import 'package:bookdoctor/featuers/Auth/domin/Entitty/SingEntity.dart';
import 'package:dartz/dartz.dart';

abstract class SingRepo {
  Future<Either<faluires, bool>> SendFeaTuredAskToSing(
      EntityAskToSing askToSingEntity);
  Future<Either<faluires, bool>> SendFeaTuredSing(EntitySing singEntity);
}
