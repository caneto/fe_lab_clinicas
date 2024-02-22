import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_panel/src/pages/panel/widgets/panel_principal_widget.dart';
import 'package:flutter/material.dart';

class PanelPage extends StatelessWidget {
  const PanelPage({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: LabClinicasAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
               height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: sizeOf.width *.4,  
                  child: const PanelPrincipalWidget(
                    passwordLabel: 'Senha Anterior',
                    password: 'BG8523',
                    deskNumber: '03',
                    labelColor: LabClinicasTheme.blueColor,
                    buttonColor: LabClinicasTheme.orangeColor,
                  ),
                ),
                const SizedBox(
                   width: 20,
                ),
                SizedBox(
                  width: sizeOf.width *.4,  
                  child: const PanelPrincipalWidget(
                    passwordLabel: 'Chamando Senha',
                    password: 'BG8523',
                    deskNumber: '03',
                    labelColor: LabClinicasTheme.orangeColor,
                    buttonColor: LabClinicasTheme.blueColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
