import 'dart:async';
import 'dart:developer';

import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_panel/src/bindindgs/lab_clinicas_application_binding_panel.dart';
import 'package:fe_lab_clinicas_panel/src/pages/login/login_router.dart';
import 'package:fe_lab_clinicas_panel/src/pages/panel/panel_router.dart';
import 'package:fe_lab_clinicas_panel/src/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const LabClinicasPanelApp());
  }, (error, stack) {
    log('Erro não tratado', error: error, stackTrace: stack);
    throw error;
  });
}

class LabClinicasPanelApp extends StatelessWidget {
  const LabClinicasPanelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LabClinicasCoreConfig(
      title: 'Lab Clinicas Painel',
      binding: LabClinicasApplicationBindingPanel(),
      pagesBuilders: [
        FlutterGetItPageBuilder(page: (_) => const SplashPage(), path: '/'),
      ],
      pages: const [
        LoginRouter(),
        PanelRouter(),
      ],
    );
  }
}
