import 'package:fe_lab_clinicas_adm/src/pages/checkin/checkin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import '../../models/patient_information_form_model.dart';
import 'checkin_controller.dart';

class CheckinRouter extends FlutterGetItPageRouter {
  CheckinRouter()
      : super(
          name: '/checkin',
          bindings: [
            Bind.lazySingleton((i) => CheckinController(patiantInformationFormRepository: i())),
          ],
          builder: (context) {
            final form = ModalRoute.of(context)!.settings.arguments
                as PatientInformationFormModel;
            context.get<CheckinController>().informationForm.value = form;
            return const CheckinPage();
          },
        );
}
