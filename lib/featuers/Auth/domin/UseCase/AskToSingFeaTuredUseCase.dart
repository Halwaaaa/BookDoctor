import 'package:bookdoctor/core/Excption/Excption.dart';
import 'package:bookdoctor/core/errors/faliure.dart';
import 'package:bookdoctor/core/servers/initernet.dart';
import 'package:bookdoctor/core/utles/useCase.dart';
import 'package:bookdoctor/featuers/Auth/Data/Modles/ModlesAskToSing.dart';
import 'package:bookdoctor/featuers/Auth/domin/Entitty/AsktoEntity.dart';
import 'package:bookdoctor/featuers/Auth/domin/Entitty/checkIfEmailEntity.dart';
import 'package:bookdoctor/featuers/Auth/domin/Repos/SingRepo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AskToSingFeaTuredUseCase
    extends UseCase<DocumentReference, ModlesAskToSing> {
  final SingRepo singRepo;

  AskToSingFeaTuredUseCase({
    required this.singRepo,
  });

  @override
  Future<Either<faluires, DocumentReference>> call(
      ModlesAskToSing askToSing) async {
    // TODO: implement call
    try {
      await internetConection.checkInternet();
    } catch (e) {
      y(e);
    }
    return singRepo.SendFeaTuredAskToSing(askToSing);
  }

  Either<faluires, dynamic> y(dynamic error) {
    if (error is internetConectionEx) {
      return left(faluiresInternet(masseges: error.message));
    }
    return left(unknowfaluires(masseges: "ssss"));
  }
}
