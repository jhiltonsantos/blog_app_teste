import 'package:blog_teste_tecnico/data/interceptors/logging_interceptor.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';

const String baseUrl = 'https://jsonplaceholder.typicode.com';

const headerAPI = <String, String>{
  'Content-type': 'application/json',
};

final http.Client client = InterceptedClient.build(
    interceptors: [LoggingInterceptor()],
    requestTimeout: const Duration(seconds: 5));
