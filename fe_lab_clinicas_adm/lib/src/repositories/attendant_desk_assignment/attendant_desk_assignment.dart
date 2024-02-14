import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';

abstract interface class AttendantDeskAssignment {
  Future<Either<RepositoryException, Unit>> startService(int deskNumber);
}