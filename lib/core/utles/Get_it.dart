import 'package:bookdoctor/featuers/Auth/Data/RemotleDataSource/SingRemote.dart';
import 'package:bookdoctor/featuers/Auth/Data/Repoes/SingRepo.dart';
import 'package:bookdoctor/featuers/Auth/domin/Repos/SingRepo.dart';
import 'package:bookdoctor/featuers/Auth/domin/UseCase/AskToSingFeaTuredUseCase.dart';
import 'package:bookdoctor/featuers/Auth/domin/UseCase/SendFeaTuredLoginUseCase.dart';
import 'package:get_it/get_it.dart';

class get_it {
  final GetIt getIt = GetIt.instance;

  void dispose() {
    GetIt.instance.reset();
  }

  void setup() {
    // تسجيل SingRemoteDataSourceImp كمصدر للبيانات
    if (!getIt.isRegistered<SingRemoteDataSousrceImp>()) {
      getIt.registerLazySingleton<SingRemoteDataSousrceImp>(
          () => SingRemoteDataSousrceImp());
    }
    if (!getIt.isRegistered<checkIfEmailRegisteredWithGoogle>()) {
      getIt.registerLazySingleton<checkIfEmailRegisteredWithGoogle>(() =>
          checkIfEmailRegisteredWithGoogle(singRepo: getIt<SingReposImplo>()));
    }
    // تسجيل SingReposImplo كمستودع
    if (!getIt.isRegistered<SingReposImplo>()) {
      getIt.registerLazySingleton<SingReposImplo>(() => SingReposImplo(
          singRemoteDataSousrce: getIt<SingRemoteDataSousrceImp>()));
    }
    if (!getIt.isRegistered<AskToSingFeaTuredUseCase>()) {
      // تسجيل AskToSingFeaTuredUseCase كحالة استخدام
      getIt.registerLazySingleton<AskToSingFeaTuredUseCase>(
          () => AskToSingFeaTuredUseCase(singRepo: getIt<SingReposImplo>()));
    }
  }
}
