import 'package:blog_teste_tecnico/core/error/failures.dart';
import 'package:equatable/equatable.dart';

abstract class UserCase<Type, Params> {
  Future<Type> call (Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}