import 'package:fe_lab_clinicas_adm/src/models/patient_information_form_model.dart';
import 'package:fe_lab_clinicas_adm/src/pages/pre_checkin/pre_checkin_controller.dart';
import 'package:fe_lab_clinicas_adm/src/pages/pre_checkin/pre_checkin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class PreCheckinRouter extends FlutterGetItPageRouter {
  PreCheckinRouter()
      : super(
          name: '/pre-checkin',
          bindings: [
            Bind.lazySingleton(
              (i) => PreCheckinController(
                callNextPatientService: i(),
              ),
            )
          ],
          builder: (context) {
            final form = ModalRoute.of(context)!.settings.arguments as PatientInformationFormModel;
            context.get<PreCheckinController>().informationForm.value = form;
            return const PreCheckinPage();
          },
        );
}
