import 'package:blog_teste_tecnico/domain/entities/address.dart';
import 'package:blog_teste_tecnico/domain/entities/company.dart';

class User {
  int? id;
  String? name;
  String? username;
  String? email;
  Address address;
  String? phone;
  String? website;
  Company company;

  User(
      this.id,
      this.name,
      this.username,
      this.email,
      this.address,
      this.phone,
      this.website,
      this.company);

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        username = json['username'],
        email = json['email'],
        address =
            json['address'] = Address.fromJson(json['address']),
        phone = json['phone'],
        website = json['website'],
        company =
            json['company'] = Company.fromJson(json['company']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'username': username,
        'email': email,
        'address': address.toJson(),
        'phone': phone,
        'website': website,
        'company': company.toJson(),
      };
}






