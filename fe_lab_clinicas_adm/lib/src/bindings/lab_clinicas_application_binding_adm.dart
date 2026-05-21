import 'package:fe_lab_clinicas_adm/src/core/env.dart';
import 'package:fe_lab_clinicas_adm/src/repositories/attendant_desk_assignment/attendant_desk_assignment_repository.dart';
import 'package:fe_lab_clinicas_adm/src/repositories/attendant_desk_assignment/attendant_desk_assignment_repository_impl.dart';
import 'package:fe_lab_clinicas_adm/src/repositories/painel/painel_repository.dart';
import 'package:fe_lab_clinicas_adm/src/repositories/painel/painel_repository_impl.dart';
import 'package:fe_lab_clinicas_adm/src/repositories/patient_information_form/patiant_information_form_repository_impl.dart';
import 'package:fe_lab_clinicas_adm/src/services/call_next_patient/call_next_patient_service.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter_getit/flutter_getit.dart';

import '../repositories/patient_information_form/patiant_information_form_repository.dart';

class LabClinicasApplicationBindingAdm extends ApplicationBindings {
  @override
  List<Bind<Object>> bindings() => [
        Bind.lazySingleton(
          (i) => RestClient(Env.backendBaseUrl),
        ),
        Bind.lazySingleton<PatiantInformationFormRepository>(
            (i) => PatiantInformationFormRepositoryImpl(restClient: i())),
        Bind.lazySingleton<AttendantDeskAssignmentRepository>(
            (i) => AttendantDeskAssignmentRepositoryImpl(restClient: i())),
        Bind.lazySingleton<PainelRepository>(
            (i) => PainelRepositoryImpl(restClient: i())),
        Bind.lazySingleton((i) => CallNextPatientService(
            patiantInformationFormRepository: i(),
            attendantDeskAssignmentRepository: i(),
            painelRepository: i()))
      ];
}
