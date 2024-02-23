import 'package:fe_lab_clinicas_panel/src/models/panel_checkin_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

abstract interface class PanelCheckinRepository {
  ({WebSocketChannel channel, Function dispose}) openChannelSocket();
  Stream<List<PanelCheckinModel>> getTodayPanel(WebSocketChannel channel);
}
