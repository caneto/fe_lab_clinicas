import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/core/widget/app_default_especial_button.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class DonePage extends StatelessWidget {
  final selfServiceController = Injector.get<SelfServiceController>();
  DonePage({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(32),
            margin: const EdgeInsets.only(top: 18),
            constraints: BoxConstraints(maxWidth: sizeOf.width * .85),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: LabClinicasTheme.orangeColor)),
            child: Column(
              children: [
                Image.asset('assets/images/stroke_check.png'),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Sua senha é',
                  style: LabClinicasTheme.titleSmallStyle,
                ),
                const SizedBox(height: 24),
                Container(
                  constraints: const BoxConstraints(
                    minWidth: 218,
                    minHeight: 48,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: BoxDecoration(
                    color: LabClinicasTheme.orangeColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    'BG38232', //selfServiceController.password,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 40),
                const Text.rich(
                  TextSpan(
                    style: TextStyle(
                        color: LabClinicasTheme.blueColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(text: 'AGUARDE!\n'),
                      TextSpan(text: 'Sua SENHA será chamada no Painel'),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      child: AppDefaultEspecialButton(
                        sizeBoxOn: false,
                        height: 48,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: LabClinicasTheme.blueColor,
                            fixedSize: const Size.fromHeight(48)),
                        onPressed: () {},
                        label: 'IMPRIMIR SENHA',
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: AppDefaultEspecialButton(
                        tipoBotao: false,
                        height: 48,
                        width: sizeOf.width * .2,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: LabClinicasTheme.blueColor,
                          side: const BorderSide(
                              color: LabClinicasTheme.blueColor),
                          fixedSize: const Size.fromHeight(48),
                        ),
                        onPressed: () {},
                        label: 'ENVIAR SENHA VIA SMS',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                AppDefaultEspecialButton(
                  width: double.infinity,
                  height: 48,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: LabClinicasTheme.orangeColor,
                  ),
                  onPressed: () {},
                  label: 'FINALIZAR',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
