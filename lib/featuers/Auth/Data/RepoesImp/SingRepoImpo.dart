import 'package:bookdoctor/core/errors/faliure.dart';
import 'package:bookdoctor/featuers/Auth/Data/Modles/ModlesAskToSing.dart';
import 'package:bookdoctor/featuers/Auth/Data/RemotleDataSource/SingRemote.dart';
import 'package:bookdoctor/featuers/Auth/domin/Entitty/AsktoEntity.dart';
import 'package:bookdoctor/featuers/Auth/domin/Entitty/checkIfEmailEntity.dart';
import 'package:bookdoctor/featuers/Auth/domin/Repos/SingRepo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SingReposImplo extends SingRepo {
  SingRemoteDataSousrce singRemoteDataSousrce;

  SingReposImplo({
    required this.singRemoteDataSousrce,
  });
  @override
  Future<Either<faluires, DocumentReference>> SendFeaTuredAskToSing(
      ModlesAskToSing askToSing) async {
    try {
      DocumentReference reference =
          await singRemoteDataSousrce.SendFeaTuredAskToSing(askToSing);

      return right(reference);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(faluiresfiebasesing.fromFierbaseAuthEroor(e));
      }
      return left(unknowfaluires(masseges: e.toString()));
    }
  }

  @override
  Future<Either<faluires, bool>> checkIfEmailRegisteredWithGoogle(
      EntitycheckIfEmailRegistered emailRegistered) async {
    {
      try {
        bool Reslut = await singRemoteDataSousrce
            .checkIfEmailRegisteredWithGoogle(emailRegistered);

        if (Reslut == false) {
          return left(faluiresHaveAccount(masseges: 'You Have Account'));
        }
        return right(Reslut);
      } catch (e) {
        if (e is FirebaseAuthException) {
          return left(faluiresfiebasesing.fromFierbaseAuthEroor(e));
        }
        return left(unknowfaluires(masseges: e.toString()));
      }
    }
  }
}
