import 'package:bookdoctor/core/Excption/Excption.dart';
import 'package:bookdoctor/core/errors/faliure.dart';
import 'package:bookdoctor/core/servers/initernet.dart';
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
  Future<Either<faluires, bool>>? call(EntitycheckIfEmailRegistered p) async {
    try {
      await internetConection.checkInternet();
      return singRepo.checkIfEmailRegisteredWithGoogle(p);
    } catch (e) {
      y(e);
    }
    return left(unknowfaluires(masseges: "ssss"));
  }

  Either<faluires, dynamic> y(dynamic error) {
    if (error is internetConectionEx) {
      return left(faluiresInternet(masseges: error.message));
    }
    return left(unknowfaluires(masseges: "ssss"));
  }
}
