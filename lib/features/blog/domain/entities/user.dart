import 'package:equatable/equatable.dart';

import 'address.dart';
import 'company.dart';

class User extends Equatable {
  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final Address address;
  final String? phone;
  final String? website;
  final Company company;

  const User(this.id, this.name, this.username, this.email, this.address,
      this.phone, this.website, this.company);

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        username = json['username'],
        email = json['email'],
        address = json['address'] = Address.fromJson(json['address']),
        phone = json['phone'],
        website = json['website'],
        company = json['company'] = Company.fromJson(json['company']);

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

  @override
  List<Object?> get props =>
      [id, name, username, email, address, phone, website, company];
}
