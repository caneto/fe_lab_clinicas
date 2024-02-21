import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

import 'package:fe_lab_clinicas_adm/src/models/patient_information_form_model.dart';
import 'package:fe_lab_clinicas_adm/src/repositories/patient_information_form/patiant_information_form_repository.dart';

class CheckinController with MessageStateMixin {
  CheckinController({
    required PatiantInformationFormRepository patiantInformationFormRepository,
  }) : _patiantInformationFormRepository = patiantInformationFormRepository;

  final informationForm = signal<PatientInformationFormModel?>(null);
  final PatiantInformationFormRepository _patiantInformationFormRepository;
  final endProcess = signal(false);

  Future<void> endCheckin() async {
    if (informationForm() != null) {
      final result = await _patiantInformationFormRepository.updateStatus(informationForm.value!.id,
          PatiantInformationFormStatus.beingAttended);
      switch(result) {
        case Left():
          showError('Erro ao atualizar o stauts do formulario');
        case Right():
          endProcess.value = true;
      }
    } else {
      showError('Formulário não pode ser nulo');
    }
    
  }
}
