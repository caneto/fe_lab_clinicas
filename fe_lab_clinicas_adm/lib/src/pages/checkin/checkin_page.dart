import 'package:fe_lab_clinicas_adm/src/models/patient_information_form_model.dart';
import 'package:fe_lab_clinicas_adm/src/pages/checkin/widget/checkin_image_link.dart';
import 'package:fe_lab_clinicas_adm/src/shared/data_item.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:signals_flutter/signals_flutter.dart';

import 'checkin_controller.dart';

class CheckinPage extends StatefulWidget {
  const CheckinPage({super.key});

  @override
  State<CheckinPage> createState() => _CheckinPageState();
}

class _CheckinPageState extends State<CheckinPage> with MessageViewMixin {
  final controller = Injector.get<CheckinController>();
  late final EffectCleanup effectCleanup;

  @override
  void initState() {
    messageListener(controller);
    effectCleanup = effect(() {
      if (controller.endProcess()) {
        Navigator.of(context).pushReplacementNamed('/end-checkin');
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
    final sizeOf = MediaQuery.sizeOf(context);

    final PatientInformationFormModel(
      :password,
      :patient,
      :medicalOrders,
      :healthInsuranceCard
    ) = controller.informationForm.watch(context)!;

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
                  width: sizeOf.width * .22,
                  decoration: BoxDecoration(
                    color: LabClinicasTheme.orangeColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    password,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: LabClinicasTheme.lightOrangeColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    'Cadastro',
                    style: LabClinicasTheme.subTitleSmallStyle.copyWith(
                      color: LabClinicasTheme.orangeColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                DataItem(
                  label: 'Nome Paciente',
                  value: patient.name,
                  padding: const EdgeInsets.only(bottom: 24),
                ),
                DataItem(
                  label: 'Email',
                  value: patient.email,
                  padding: const EdgeInsets.only(bottom: 24),
                ),
                DataItem(
                  label: 'Telefone de Contato',
                  value: patient.phoneNumber,
                  padding: const EdgeInsets.only(bottom: 24),
                ),
                DataItem(
                  label: 'CPF',
                  value: patient.document,
                  padding: const EdgeInsets.only(bottom: 24),
                ),
                DataItem(
                  label: 'CEP',
                  value: patient.address.cep,
                  padding: const EdgeInsets.only(bottom: 24),
                ),
                DataItem(
                  label: 'Endereço',
                  value:
                      '${patient.address.streetAddress}, ${patient.address.number} '
                      '${patient.address.addressComplement}, ${patient.address.district}, '
                      '${patient.address.city} - ${patient.address.state}',
                  padding: const EdgeInsets.only(bottom: 24),
                ),
                DataItem(
                  label: 'Responsável',
                  value: patient.guardian,
                  padding: const EdgeInsets.only(bottom: 24),
                ),
                DataItem(
                  label: 'Documento de Identificação',
                  value: patient.guardianIdentificationNumber,
                  padding: const EdgeInsets.only(bottom: 24),
                ),
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: LabClinicasTheme.lightOrangeColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    'Validar Imagens Exames',
                    style: LabClinicasTheme.subTitleSmallStyle.copyWith(
                      color: LabClinicasTheme.orangeColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CheckinImageLink(
                      label: 'Cartteirinha',
                      image: healthInsuranceCard,
                    ),
                    Column(
                      children: [
                        for (final (index, medicalOrder)
                            in medicalOrders.indexed)
                          CheckinImageLink(
                            label: 'Pedido médidco ${index + 1}',
                            image: medicalOrder,
                          ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 24),
                AppDefaultEspecialButton(
                  sizeBoxOn: true,
                  width: double.infinity,
                  height: 48,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: LabClinicasTheme.blueColor,
                      fixedSize: const Size.fromHeight(48)),
                  onPressed: () {
                    controller.endCheckin();
                  },
                  label: 'FINALIZAR ATENDIMENTO',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
