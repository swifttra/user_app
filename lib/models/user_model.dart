import 'package:firebase_database/firebase_database.dart';

class UserModel {
  String? phone;
  String? name;
  String? surname;
  String? id;
  String? email;

  UserModel({
    this.phone,
    this.name,
    this.surname,
    this.id,
    this.email,
  });

  UserModel.fromSnapshot(DataSnapshot snap) {
    phone = (snap.value as dynamic)["phone"];
    name = (snap.value as dynamic)["name"];
    surname = (snap.value as dynamic)["surname"];
    id = snap.key;
    email = (snap.value as dynamic)["email"];
  }
}
