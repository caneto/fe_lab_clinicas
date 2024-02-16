import 'package:fe_lab_clinicas_adm/src/models/patient_information_form_model.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';

abstract interface class PatiantInformationFormRepository {
  Future<Either<RepositoryException, PatientInformationFormModel?>>  callNextToCheckin();
  Future<Either<RepositoryException, Unit>> updateStatus(String id, PatiantInformationFormStatus status);
}