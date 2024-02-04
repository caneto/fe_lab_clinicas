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

class _SelfServicePageState extends State<SelfServicePage> with MessageViewMixin {

  final controller = Injector.get<SelfServiceController>();

  @override
  void initState() {
    messageListener(controller);
    WidgetsBinding.instance.addPostFrameCallback((_) { 
      effect(() {
        var baseRoute = '/self-service/';
        final step = controller.step;

        switch(step) {
          
          case FormSteps.none:
          return;
          case FormSteps.whoIAm:
          return;
          case FormSteps.findPatient:
          return;
          case FormSteps.patient:
          return;
          case FormSteps.documents:
          return;
          case FormSteps.done:
          return;
          case FormSteps.restart:
          return;          
        }
      });
    });
    super.initState();
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
