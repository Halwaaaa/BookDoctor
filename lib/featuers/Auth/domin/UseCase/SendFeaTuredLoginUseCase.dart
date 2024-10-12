import 'package:bookdoctor/core/errors/faliure.dart';
import 'package:bookdoctor/core/utles/useCase.dart';
import 'package:bookdoctor/featuers/Auth/domin/Entitty/AsktoEntity.dart';
import 'package:bookdoctor/featuers/Auth/domin/Entitty/checkIfEmailEntity.dart';
import 'package:bookdoctor/featuers/Auth/domin/Repos/SingRepo.dart';
import 'package:dartz/dartz.dart';

class checkIfEmailRegisteredWithGoogle
    extends UseCase<bool, EntitycheckIfEmailRegistered> {
  final SingRepo singRepo;
  checkIfEmailRegisteredWithGoogle({required this.singRepo});

  @override
  Future<Either<faluires, bool>> call(EntitycheckIfEmailRegistered p) {
    return singRepo.checkIfEmailRegisteredWithGoogle(p);
  }
}
