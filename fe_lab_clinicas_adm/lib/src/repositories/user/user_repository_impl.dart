import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';

import './user_repository.dart';

class UserRepositoryImpl implements UserRepository {

  final RestClient restClient;

  UserRepositoryImpl({required this.restClient});

  @override
  Future<Either<AuthException, String>> login(String email, String password) async {
    try{
      final Response(data: {'access_token': accessToken}) = await restClient.unauth.post('/auth', data: {
        'email': email,
        'password': password,        
      });
      return Right(accessToken);
    } on DioException catch(e, s) {
      log("Erro ao realizar login", error: e, stackTrace: s);
      return switch(e) {
        DioException(response: Response(statusCode: HttpStatus.forbidden)?) => Left(AuthUnauthorizedException()),
        _ => Left(AuthError(message: 'Erro ao realizar login'))
      };
    }
  }
  
}