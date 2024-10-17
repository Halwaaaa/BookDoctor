import 'dart:io';

class ModlesAskToSing {
  String? name;
  String? email;
  String? phone;
  File? Cv;
  String? part;
  ModlesAskToSing({
    required this.Cv,
    required this.name,
    required this.email,
    required this.part,
    required this.phone,
  });
  ModlesAskToSing.FromJson(Map<String, dynamic> json) {
    Cv = json['Cv'];
    name = json['name'];
    email = json['email'];
    part = json['part'];
    phone = json['phone'];
  }
  Map<String, dynamic> ToMap() {
    return {
      'Cv': Cv,
      'name': name,
      'email': email,
      'part': part,
      'phone': phone,
    };
  }
}
