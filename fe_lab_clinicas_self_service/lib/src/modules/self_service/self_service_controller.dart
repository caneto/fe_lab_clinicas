
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

enum FormSteps {
  none, 
  whoIAm,
  findPatient,
  patient,
  documents,
  done,
  restart, 
}

class SelfServiceController with MessageStateMixin {
  final _step = ValueSignal(FormSteps.none);

  FormSteps get step => _step();
  
}