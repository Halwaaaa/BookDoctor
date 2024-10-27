import 'package:bookdoctor/featuers/Auth/Data/RemotleDataSource/SingRemote.dart';
import 'package:bookdoctor/featuers/Auth/Data/Repoes/SingRepo.dart';
import 'package:bookdoctor/featuers/Auth/domin/Repos/SingRepo.dart';
import 'package:bookdoctor/featuers/Auth/domin/UseCase/AskToSingFeaTuredUseCase.dart';
import 'package:get_it/get_it.dart';

class get_it {
  final getIt = GetIt.instance;

  void setup() {
    // تسجيل SingRemoteDataSourceImp كمصدر للبيانات
    getIt.registerCachedFactory<SingRemoteDataSousrce>(
        () => SingRemoteDataSousrceImp());

    // تسجيل SingReposImplo كمستودع
    getIt.registerCachedFactory<SingRepo>(() =>
        SingReposImplo(singRemoteDataSousrce: getIt<SingRemoteDataSousrce>()));

    // تسجيل AskToSingFeaTuredUseCase كحالة استخدام
    getIt.registerCachedFactory<AskToSingFeaTuredUseCase>(
        () => AskToSingFeaTuredUseCase(singRepo: getIt<SingRepo>()));
  }
}
