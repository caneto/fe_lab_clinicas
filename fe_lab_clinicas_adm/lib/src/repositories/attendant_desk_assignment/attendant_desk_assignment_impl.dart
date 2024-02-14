import 'package:dio/dio.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';

import './attendant_desk_assignment.dart';

class AttendantDeskAssignmentImpl implements AttendantDeskAssignment {
  
  AttendantDeskAssignmentImpl({required this.restClient});
  
  final RestClient restClient;

  @override
  Future<Either<RepositoryException, Unit>> startService(int deskNumber) {

  }

  Future<({String id, int deskNumber})> _getDeskByUser() async {
    final Response() = await restClient.auth.get('/attendantDeskAssignment', queryParameters: {
      
    });
  }
}
