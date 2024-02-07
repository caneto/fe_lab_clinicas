import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/core/widget/app_default_especial_button.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/dcuments/widgets/document_box_widget.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/widgets/lab_clinicas_self_service_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class DocumentsPage extends StatefulWidget {
  const DocumentsPage({super.key});

  @override
  State<DocumentsPage> createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> {
  final _formKey = GlobalKey<FormState>();
  final selfServiceController = Injector.get<SelfServiceController>();

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: LabClinicasSelfServiceAppBar(),
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
                Image.asset('assets/images/folder.png'),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'ADICIONAR DOCUMENTOS',
                  style: LabClinicasTheme.titleSmallStyle,
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  'Selecione o documento que deseja fotografar',
                  style: LabClinicasTheme.subTitleSmallStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: sizeOf.width * .8,
                  height: 265,
                  child: Row(
                    children: [
                      DocumentBoxWidget(
                        uploaded: true,
                        icon: Image.asset('assets/images/id_card.png'),
                        label: 'CARTEIRINHA',
                        totalFiles: 0,
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      DocumentBoxWidget(
                        uploaded: false,
                        icon: Image.asset('assets/images/document.png'),
                        label: 'PEDIDO MÉDICO',
                        totalFiles: 0,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: AppDefaultEspecialButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.red,
                          side: const BorderSide(color: Colors.red),
                          //fixedSize: const Size.fromHeight(48) => o custom define 
                        ),
                        onPressed: () {},
                        label: 'REMOVER TODAS',
                        width: sizeOf.width * .85,
                        height: 48,
                        tipoBotao: false,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: AppDefaultEspecialButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: LabClinicasTheme.orangeColor,
                          //fixedSize: const Size.fromHeight(48) => o custom define
                        ),
                        onPressed: () {},
                        label: 'FINALIZAR',
                        width: sizeOf.width * .85,
                        height: 48,
                        tipoBotao: true,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _salvarecontinuar() {
    final formValid = _formKey.currentState?.validate() ?? false;

    if (formValid) {
      FocusScope.of(context).unfocus();

      //if (patientFound) {
      //controller
      //  .updateAndNext(updatePatient(selfServiceController.model.patient!));
      //} else {
      //controller.savaAndNext(createPatientRegister());
      //}
    }
  }

  void _continuar() {
    //controller.patient = selfServiceController.model.patient;
    //controller.goNextStep();
  }
}
