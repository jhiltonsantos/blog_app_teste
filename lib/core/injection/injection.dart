import 'package:blog_teste_tecnico/core/injection/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

// https://blog.logrocket.com/dependency-injection-flutter-using-getit-injectable/

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => $initGetIt(getIt);
