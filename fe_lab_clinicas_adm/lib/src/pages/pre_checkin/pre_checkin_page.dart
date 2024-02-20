import 'package:fe_lab_clinicas_adm/src/shared/data_item.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';

class PreCheckinPage extends StatelessWidget {
  const PreCheckinPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: LabClinicasAppBar(),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            padding: const EdgeInsets.all(40),
            margin: const EdgeInsets.only(top: 32),
            width: sizeOf.width * .5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: LabClinicasTheme.orangeColor),
            ),
            child: Column(
              children: [
                Image.asset('assets/images/patient_avatar.png'),
                const SizedBox(height: 16),
                const Text(
                  'A senha chamada foi',
                  style: LabClinicasTheme.titleSmallStyle,
                ),
                const SizedBox(height: 16),
                Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  width: 218,
                  decoration: BoxDecoration(
                    color: LabClinicasTheme.orangeColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    "xxxxx",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                const DataItem(label: 'Nome Paciente', value: 'Carlos Alberto', padding: EdgeInsets.only(bottom: 24)),
                const DataItem(label: 'Email', value: 'Carlos Alberto',padding: EdgeInsets.only(bottom: 24)),
                const DataItem(label: 'Telefone de Contato', value: 'Carlos Alberto',padding: EdgeInsets.only(bottom: 24)),
                const DataItem(label: 'CPF', value: 'Carlos Alberto',padding: EdgeInsets.only(bottom: 24)),
                const DataItem(label: 'CEP', value: 'Carlos Alberto',padding: EdgeInsets.only(bottom: 24)),
                const DataItem(label: 'Endereço', value: 'Carlos Alberto',padding: EdgeInsets.only(bottom: 24)),
                const DataItem(label: 'Responsável', value: 'Carlos Alberto',padding: EdgeInsets.only(bottom: 24)),
                const DataItem(label: 'Documento de Identificação', value: 'Carlos Alberto',padding: EdgeInsets.only(bottom: 24)),
                const SizedBox(
                   height: 48,
                ),
                 Row(
                  children: [
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
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        label: 'CHAMAR OUTRA SENHA',
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: AppDefaultEspecialButton(
                        sizeBoxOn: false,
                        height: 48,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: LabClinicasTheme.blueColor,
                            fixedSize: const Size.fromHeight(48)),
                        onPressed: () async {
                        },
                        label: 'ATENDER',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
