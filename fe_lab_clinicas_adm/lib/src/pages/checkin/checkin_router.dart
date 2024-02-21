import 'package:fe_lab_clinicas_adm/src/pages/checkin/checkin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import '../../models/patient_information_form_model.dart';
import 'checkin_controller.dart';

class CheckinRouter extends FlutterGetItPageRouter {
  const CheckinRouter({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton((i) => CheckinController(patiantInformationFormRepository: i())),
      ];

  @override
  String get routeName => '/checkin';

  @override
  WidgetBuilder get view => (context) {
        final form = ModalRoute.of(context)!.settings.arguments
            as PatientInformationFormModel;
        context.get<CheckinController>().informationForm.value = form;
        return const CheckinPage();
      };
}
