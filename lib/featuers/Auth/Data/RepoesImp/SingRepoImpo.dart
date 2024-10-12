import 'package:bookdoctor/core/errors/faliure.dart';
import 'package:bookdoctor/featuers/Auth/Data/RemotleDataSource/SingRemote.dart';
import 'package:bookdoctor/featuers/Auth/domin/Entitty/AsktoEntity.dart';
import 'package:bookdoctor/featuers/Auth/domin/Entitty/checkIfEmailEntity.dart';
import 'package:bookdoctor/featuers/Auth/domin/Repos/SingRepo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SingReposImplo extends SingRepo {
  SingRemoteDataSousrce singRemoteDataSousrce;

  SingReposImplo({
    required this.singRemoteDataSousrce,
  });
  @override
  Future<Either<faluires, UserCredential>> SendFeaTuredAskToSing(
      EntityAskToSing askToSingEntity) async {
    try {
      UserCredential userCredential =
          await singRemoteDataSousrce.SendFeaTuredAskToSing(askToSingEntity);

      return right(userCredential);
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
          return left(faluiresHaveAccount(masseges: 'No'));
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
