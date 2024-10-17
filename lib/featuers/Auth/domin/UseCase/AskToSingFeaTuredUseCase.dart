import 'package:bookdoctor/core/errors/faliure.dart';
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
  Future<Either<faluires, DocumentReference>> call(ModlesAskToSing askToSing) {
    // TODO: implement call
    return singRepo.SendFeaTuredAskToSing(askToSing);
  }
}
