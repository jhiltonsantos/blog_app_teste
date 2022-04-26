import 'package:equatable/equatable.dart';

import 'geo.dart';

class Address extends Equatable {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo? geo;

  const Address(this.street, this.suite, this.city, this.zipcode, this.geo);

  Address.fromJson(Map<String, dynamic> json)
      : street = json['street'],
        suite = json['suite'],
        city = json['city'],
        zipcode = json['zipcode'],
        geo = json['geo'] = Geo.fromJson(json['geo']);

  Map<String, dynamic> toJson() => {
        'street': street,
        'suite': suite,
        'city': city,
        'zipcode': zipcode,
        'geo': geo!.toJson(),
      };

  @override
  List<Object?> get props => [street, suite, city, zipcode, geo];
}
