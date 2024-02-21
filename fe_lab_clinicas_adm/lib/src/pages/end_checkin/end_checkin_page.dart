import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:signals_flutter/signals_flutter.dart';

import 'end_checkin_controller.dart';

class EndCheckinPage extends StatefulWidget {
  const EndCheckinPage({super.key});

  @override
  State<EndCheckinPage> createState() => _EndCheckinPageState();
}

class _EndCheckinPageState extends State<EndCheckinPage> with MessageViewMixin {
  final controller = Injector.get<EndCheckinController>();
  late final EffectCleanup effectCleanup;

  @override
  void initState() {
    messageListener(controller);
    effectCleanup = effect(() {
      if (controller.informationForm() != null) {
        Navigator.of(context).pushReplacementNamed(
          '/pre-checkin',
          arguments: controller.informationForm(),
        );
      }
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
    var sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: LabClinicasAppBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          padding: const EdgeInsets.all(40),
          margin: const EdgeInsets.only(top: 56),
          width: sizeOf.width * .5,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: LabClinicasTheme.orangeColor),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/check_icon.png'),
              const SizedBox(height: 40),
              const Text(
                'Atendimento Finalizado com Sucesso',
                style: LabClinicasTheme.titleSmallStyle,
              ),
              const SizedBox(
                height: 80,
              ),
              AppDefaultEspecialButton(
                tipoBotao: true,
                onPressed: () {
                  controller.callNextPatient();
                },
                label: 'CHAMAR OUTRA SENHA',
                width: sizeOf.width * .8,
                height: 48,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
