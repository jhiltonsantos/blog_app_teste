import 'package:equatable/equatable.dart';

class Company extends Equatable {
  final String name;
  final String catchPhrase;
  final String bs;

  const Company(this.name, this.catchPhrase, this.bs);

  Company.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        catchPhrase = json['catchPhrase'],
        bs = json['bs'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'catchPhrase': catchPhrase,
        'bs': bs,
      };

  @override
  List<Object?> get props => [name, catchPhrase, bs];
}
