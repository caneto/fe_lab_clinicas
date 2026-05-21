import 'package:fe_lab_clinicas_adm/src/pages/home/home_controller.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'home_page.dart';

class HomeRouter extends FlutterGetItPageRouter {
  HomeRouter()
      : super(
          name: '/home',
          bindings: [
            Bind.lazySingleton((i) => HomeController(
                attendantDeskRepository: i(), callNextPatientService: i())),
          ],
          builder: (_) => const HomePage(),
        );
}
