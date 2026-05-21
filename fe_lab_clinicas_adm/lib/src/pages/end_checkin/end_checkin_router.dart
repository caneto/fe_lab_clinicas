import 'package:fe_lab_clinicas_adm/src/pages/end_checkin/end_checkin_controller.dart';
import 'package:fe_lab_clinicas_adm/src/pages/end_checkin/end_checkin_page.dart';
import 'package:flutter_getit/flutter_getit.dart';

class EndCheckinRouter extends FlutterGetItPageRouter {
  EndCheckinRouter()
      : super(
          name: '/end-checkin',
          bindings: [
            Bind.lazySingleton(
              (i) => EndCheckinController(callNextPatientService: i()),
            )
          ],
          builder: (_) => const EndCheckinPage(),
        );
}
