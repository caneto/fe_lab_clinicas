
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/patient/patient_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/patient/patient_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class PatientRouter extends FlutterGetItModulePageRouter {
  const PatientRouter({super.key});

@override
  List<Bind<Object>> get bindings => [
    Bind.lazySingleton((i) => PatientController(repository: i()))
  ];

  @override
  WidgetBuilder get view => (_) => const PatientPage();
  
}