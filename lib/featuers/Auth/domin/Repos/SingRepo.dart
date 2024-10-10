import 'package:bookdoctor/featuers/Auth/domin/Entitty/AsktoEntity.dart';
import 'package:bookdoctor/featuers/Auth/domin/Entitty/SingEntity.dart';

abstract class SingRepo {
  Future<bool> SendFeaTuredAskToSing(AskToSingEntity askToSingEntity);
  Future<bool> SendFeaTuredSing(SingEntity singEntity);
}
