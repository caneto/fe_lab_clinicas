import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_panel/src/models/panel_checkin_model.dart';
import 'package:intl/intl.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

abstract interface class PanelCheckinRepository {
  PanelCheckinRepository({required this.restClient});

  final RestClient restClient;

  ({WebSocket channel, Function dispose}) openChannelSocket();
  Stream<List<PanelCheckinModel>> getTodayPanel(WebSocketChannel channel);

  Future<List<PanelCheckinModel>> requestData() async {
    final dateFormat = DateFormat('y-MM-d');
    final Response(:List data) = await restClient.auth.get('/painelCheckin',
        queryParameters: {'time_called': dateFormat.format(DateTime.now())});

    return data.reversed
        .take(7)
        .map((e) => PanelCheckinModel.fromJson(e))
        .toList();
  }
}
