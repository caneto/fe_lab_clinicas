import 'package:dio/dio.dart';
import 'package:fe_lab_clinicas_adm/src/models/patient_information_form_model.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';

import './patiant_information_form_repository.dart';

class PatiantInformationFormRepositoryImpl
    implements PatiantInformationFormRepository {
  PatiantInformationFormRepositoryImpl({required this.restClient});

  final RestClient restClient;

  @override
  Future<Either<RepositoryException, PatientInformationFormModel?>>
      callNextToCheckin() async {
    final Response(:List data) = await restClient.auth
        .get('/patientInformationForm', queryParameters: {
      'status': PatiantInformationFormStatus.waiting.id,
      'page': 1,
      'limit': 1
    });

    if (data.isEmpty) {
      return Right(null);
    }

    final formData = data.first;
    final updateStatusResult =
        updateStatus(formData['id'], PatiantInformationFormStatus.checkIn);

    switch(updateStatusResult) {
      case Left(value: final exception):
        Left(exception);
      case Right():
        formData['status'] = PatiantInformationFormStatus.checkIn.id;
        formData['patient'] =
    }
  }

  @override
  Future<Either<RepositoryException, Unit>> updateStatus(
      String id, PatianInformationFormStatus status) {
    // TODO: implement updateStatus
    throw UnimplementedError();
  }
}
