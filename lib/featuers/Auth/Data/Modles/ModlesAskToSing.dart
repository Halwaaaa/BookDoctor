<<<<<<< HEAD
=======
import 'package:bookdoctor/core/utles/Eumes.dart';

>>>>>>> Auth
class ModlesAskToSing {
  String? name;
  String? email;
  String? phone;
  String? part;
  String? Uid;
<<<<<<< HEAD
=======
  String Sataus = 'REQ';
>>>>>>> Auth
  ModlesAskToSing({
    required this.name,
    required this.email,
    required this.part,
    required this.phone,
    required this.Uid,
  });
  ModlesAskToSing.FromJson(Map<String, dynamic> json) {
    name = json['name'];
    Uid = json['Uid'];
    email = json['email'];
    part = json['part'];
    phone = json['phone'];
<<<<<<< HEAD
=======
    Sataus = json['Sataus'];
>>>>>>> Auth
  }
  Map<String, dynamic> ToMap() {
    return {
      'name': name,
      'email': email,
      'part': part,
      'phone': phone,
      'Uid': Uid,
<<<<<<< HEAD
=======
      'Sataus': Sataus
>>>>>>> Auth
    };
  }
}
