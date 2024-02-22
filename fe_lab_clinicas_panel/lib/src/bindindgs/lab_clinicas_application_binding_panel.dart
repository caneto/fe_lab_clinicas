
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter_getit/flutter_getit.dart';

import '../core/env.dart';

class LabClinicasApplicationBindingPanel extends ApplicationBindings {
  @override
  List<Bind<Object>> bindings() => [
        Bind.lazySingleton(
          (i) => RestClient(Env.backendBaseUrl),
        ),
      ];
}
