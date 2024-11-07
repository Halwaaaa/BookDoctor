import 'package:bookdoctor/core/Excption/Excption.dart';
import 'package:bookdoctor/core/errors/faliure.dart';
import 'package:bookdoctor/core/servers/initernet.dart';
import 'package:bookdoctor/core/utles/Eumes.dart';
import 'package:bookdoctor/core/utles/useCase.dart';
import 'package:bookdoctor/featuers/Auth/domin/Entitty/LoginEntity.dart';
import 'package:bookdoctor/featuers/Auth/domin/Repos/LoingRepo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SendFeaTuredLoginUaseCase extends UseCase<UserCredential, EntityLogin> {
  final LoingRepo loingRepo;
  SendFeaTuredLoginUaseCase(this.loingRepo);

  @override
  Future<Either<faluires, UserCredential>>? call(EntityLogin p) async {
    try {
      await internetConection.checkInternet();
    } catch (e) {
      y(e);
    }
    return loingRepo.SendFeaTuredLogin(p);
  }

  Either<faluires, dynamic> y(dynamic error) {
    if (error is internetConectionEx) {
      return left(faluiresInternet(masseges: error.message));
    }
    return left(unknowfaluires(masseges: "ssss"));
  }
}
