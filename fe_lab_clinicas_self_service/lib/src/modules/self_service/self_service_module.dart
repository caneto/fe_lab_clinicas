import 'package:fe_lab_clinicas_self_service/src/modules/self_service/done/done_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/find_patient/find_patient_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/find_patient/find_patient_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/patient/patient_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/patient/patient_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/dcuments/scan_confirm/documents_scan_confirm_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/documents/document_repository.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/documents/document_repository_impl.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/information_form/information_form_repository.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/information_form/information_form_repository_impl.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/patients/patient_repository.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/patients/patient_repository_impl.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'dcuments/documents_page.dart';
import 'dcuments/scan/documents_scan_page.dart';
import 'dcuments/scan_confirm/documents_scan_confirm_page.dart';
import 'self_service_page.dart';
import 'who_i_am/who_i_am_page.dart';

class SelfServiceModule extends FlutterGetItModule {
  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<InformationFormRepository>(
            (i) => InformationFormRepositoryImpl(restClient: i())),
        Bind.lazySingleton((i) => SelfServiceController(informationFormRepository: i())),
        Bind.lazySingleton<PatientRepository>(
            (i) => PatientRepositoryImpl(restClient: i()))
      ];

  @override
  String get moduleRouteName => '/self-service';

  @override
  List<FlutterGetItPageRouter> get pages => [
        FlutterGetItPageRouter(
          name: '/',
          builder: (context) => const SelfServicePage(),
        ),
        FlutterGetItPageRouter(
          name: '/whoIAm',
          builder: (context) => const WhoIAmPage(),
        ),
        FlutterGetItPageRouter(
          name: '/findPatient',
          builder: (context) => const FindPatientPage(),
          bindings: [
            Bind.lazySingleton(
              (i) => FindPatientController(patientRepository: i()),
            ),
          ],
        ),
        FlutterGetItPageRouter(
          name: '/patient',
          builder: (context) => const PatientPage(),
          bindings: [
            Bind.lazySingleton(
              (i) => PatientController(repository: i()),
            ),
          ],
        ),
        FlutterGetItPageRouter(
          name: '/documents',
          builder: (context) => const DocumentsPage(),
        ),
        FlutterGetItPageRouter(
          name: '/documents/scan',
          builder: (context) => const DocumentsScanPage(),
        ),
        FlutterGetItPageRouter(
          name: '/documents/scan/confirm',
          builder: (context) => DocumentsScanConfirmPage(),
          bindings: [
            Bind.lazySingleton<DocumentRepository>(
              (i) => DocumentRepositoryImpl(restClient: i()),
            ),
            Bind.lazySingleton(
              (i) => DocumentsScanConfirmController(documentRepository: i()),
            ),
          ],
        ),
        FlutterGetItPageRouter(
          name: '/done',
          builder: (context) => DonePage(),
        ),
      ];
}
