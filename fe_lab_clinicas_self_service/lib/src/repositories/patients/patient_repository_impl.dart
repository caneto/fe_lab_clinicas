import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/model/patient_model.dart';

import './patient_repository.dart';

class PatientRepositoryImpl implements PatientRepository {
  PatientRepositoryImpl({required this.restClient});

  final RestClient restClient;

  @override
  Future<Either<RepositoryException, PatientModel?>> findPatientByDocument(
      String document) async {
    try {
      final Response(:List data) =
          await restClient.auth.get('/patients', queryParameters: {
        'document': document,
      });

      if (data.isEmpty) {
        return Right(null);
      }

      return Right(PatientModel.fromJson(data.first));
    } on DioException catch (e, s) {
      log('Erro ao buscar paciente por cpf', error: e, stackTrace: s);
      return Left(RepositoryException());
    }
  }

  @override
  Future<Either<RepositoryException, Unit>> update(PatientModel patient) async {
    try {
      await restClient.auth.put('/patients/${patient.id}', data: patient.toJson());

      return Right(unit);
    } on DioException catch (e, s) {
      log('Erro ao atualizar o patiente', error: e, stackTrace: s);
      return Left(RepositoryException());
    }
  }
}
