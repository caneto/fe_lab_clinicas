import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/models/self_service_model.dart';

abstract interface class InformationFormRepository {
  Future<Either<RepositoryException, Unit>> register(SelfServiceModel model);
}