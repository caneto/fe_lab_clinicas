import 'package:asyncstate/asyncstate.dart' as asyncstate;
import 'package:fe_lab_clinicas_adm/src/repositories/attendant_desk_assignment/attendant_desk_assignment_repository.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';

class HomeController with MessageStateMixin {
  final AttendantDeskAssignmentRepository _attendantDeskRepository;

  HomeController({required AttendantDeskAssignmentRepository attendantDeskRepository,}) : _attendantDeskRepository = attendantDeskRepository;

  Future<void> startService(int deskNumber) async {
    asyncstate.AsyncState.show();

    final result = await _attendantDeskRepository.startService(deskNumber);
    
    switch(result) {
      case Left():
        asyncstate.AsyncState.hide();
        showError('Erro ao iniciar Guichê');
      case Right():
        asyncstate.AsyncState.hide();
        // Chamar proximo paciente
        showInfo('Registrou com sucesso');
    }
  }
}
