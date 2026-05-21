import 'package:fe_lab_clinicas_panel/src/pages/panel/panel_controller.dart';
import 'package:fe_lab_clinicas_panel/src/pages/panel/panel_page.dart';
import 'package:fe_lab_clinicas_panel/src/repositories/panel_checkin/panel_checkin_repository.dart';
import 'package:fe_lab_clinicas_panel/src/repositories/panel_checkin/panel_checkin_repository_impl.dart';
import 'package:flutter_getit/flutter_getit.dart';

class PanelRouter extends FlutterGetItPageRouter {
  PanelRouter()
      : super(
          name: '/panel',
          bindings: [
            Bind.lazySingleton<PanelCheckinRepository>(
                (i) => PanelCheckinRepositoryImpl(restClient: i())),
            Bind.lazySingleton((i) => PanelController(panelCheckinRepository: i()))
          ],
          builder: (_) => const PanelPage(),
        );
}
