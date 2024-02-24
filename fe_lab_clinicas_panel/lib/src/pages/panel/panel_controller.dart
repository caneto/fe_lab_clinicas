import 'package:fe_lab_clinicas_panel/src/models/panel_checkin_model.dart';
import 'package:fe_lab_clinicas_panel/src/repositories/panel_checkin/panel_checkin_repository.dart';
import 'package:signals_flutter/signals_flutter.dart';

class PanelController {
  PanelController({required PanelCheckinRepository panelCheckinRepository})
      : _panelCheckinRepository = panelCheckinRepository;

  final PanelCheckinRepository _panelCheckinRepository;
  final panelData = listSignal<PanelCheckinModel>([]);

  Connect? _panelConnect;

  Function? _socketDispose;

  void listenerPanel() {
    final (:channel, :dispose) = _panelCheckinRepository.openChannelSocket();
    _socketDispose = dispose;

    _panelConnect = Connect(panelData);
    final panelStream = _panelCheckinRepository.getTodayPanel(channel);
    
    _panelConnect!.from(panelStream);
  }


  void dispose() {
    
    _panelConnect!.dispose();

    if(_socketDispose != null) {
      _socketDispose!();
    }
  }
}
