import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';

import './user_repository.dart';

class UserRepositoryImpl implements UserRepository {

  final RestClient restClient;

  UserRepositoryImpl({required this.restClient});

  @override
  Future<Either<AuthException, String>> login(String email, String password) async {
    try{
      final Response(data: {'access_token': access_token}) = await restClient.unauth.post('/auth', data: {
        'email': email,
        'password': password,
        'admin': true,
      });
    } on DioException catch(e, s) {
      log("Erro ao realizar login", error: e, stackTrace: s);
    }
  }
  
}