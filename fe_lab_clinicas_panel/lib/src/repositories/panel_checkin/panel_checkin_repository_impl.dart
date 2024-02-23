import 'package:fe_lab_clinicas_panel/src/models/panel_checkin_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import './panel_checkin_repository.dart';

class PanelCheckinRepositoryImpl implements PanelCheckinRepository {
  @override
  Stream<List<PanelCheckinModel>> getTodayPanel(WebSocketChannel channel) {
  }

  @override
  ({WebSocketChannel channel, Function dispose}) openChannelSocket() {
    // TODO: implement openChannelSocket
    throw UnimplementedError();
  }

}