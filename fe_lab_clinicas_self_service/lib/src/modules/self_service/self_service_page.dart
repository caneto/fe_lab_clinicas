import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:signals_flutter/signals_flutter.dart';

class SelfServicePage extends StatefulWidget {
  const SelfServicePage({super.key});

  @override
  State<SelfServicePage> createState() => _SelfServicePageState();
}

class _SelfServicePageState extends State<SelfServicePage>
    with MessageViewMixin {
  final controller = Injector.get<SelfServiceController>();
  late final EffectCleanup effectCleanup;

  @override
  void initState() {
    messageListener(controller);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.startProcess();
      effectCleanup = effect(() {
        var baseRoute = '/self-service/';
        final step = controller.step;

        switch (step) {
          case FormSteps.none:
            return;
          case FormSteps.whoIAm:
            baseRoute += 'whoIAm';
          case FormSteps.findPatient:
            baseRoute += 'findPatient';
          case FormSteps.patient:
            baseRoute += 'patient';
          case FormSteps.documents:
            baseRoute += 'documents';
          case FormSteps.done:
            baseRoute += 'done';
          case FormSteps.restart:
            Navigator.of(context).popUntil(ModalRoute.withName('/self-service'));
            controller.startProcess();
            return;
        }

        Navigator.of(context).pushNamed(baseRoute);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    effectCleanup();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
