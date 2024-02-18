import 'package:brasil_fields/brasil_fields.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/models/self_service_model.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/patient/patient_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/patient/patient_form_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/widgets/lab_clinicas_self_service_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({super.key});

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage>
    with PatientFormController, MessageViewMixin {
  final _formKey = GlobalKey<FormState>();
  final selfServiceController = Injector.get<SelfServiceController>();
  final PatientController controller = Injector.get<PatientController>();
  late final EffectCleanup effectCleanup;

  late bool patientFound;
  late bool enableForm;

  @override
  void initState() {
    messageListener(controller);

    final SelfServiceModel(:patient) = selfServiceController.model;

    patientFound = patient != null;
    enableForm = !patientFound;
    initializeForm(patient);
    effectCleanup = effect(() {
      if (controller.nextStep) {
        selfServiceController.updatePatientAndDocument(controller.patient);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    disposeForm();
    effectCleanup();
    super.dispose();
  }

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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Visibility(
                    visible: patientFound,
                    replacement: Image.asset('assets/images/lupa_icon.png'),
                    child: Image.asset('assets/images/check_icon.png'),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Visibility(
                    visible: patientFound,
                    replacement: const Text(
                      'Cadastro não encontrado',
                      style: LabClinicasTheme.titleSmallStyle,
                    ),
                    child: const Text(
                      'Cadastro encontrado',
                      style: LabClinicasTheme.titleSmallStyle,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Visibility(
                    visible: patientFound,
                    replacement: Text(
                      'Preencha o formulario abaixo para fazer o seu cadastro',
                      style: LabClinicasTheme.subTitleSmallStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    child: Text(
                      'Confirma os dados do seu cadastro',
                      style: LabClinicasTheme.subTitleSmallStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  AppDefaultTextformfield(
                    readOnly: !enableForm,
                    controller: nameEC,
                    title: 'Nome paciente',
                    validator: Validatorless.required('Nome Obrigatorio'),
                    hintText: 'Digite seu nome para continuar',
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppDefaultTextformfield(
                    readOnly: !enableForm,
                    controller: emailEC,
                    title: 'E-Mail',
                    validator: Validatorless.multiple([
                      Validatorless.required('E-Mail Obrigatorio'),
                      Validatorless.email('Email inválido'),
                    ]),
                    hintText: 'Digite seu email para continuar',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppDefaultTextformfield(
                    readOnly: !enableForm,
                    controller: phoneEC,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TelefoneInputFormatter(),
                    ],
                    title: 'Telefone de Contato',
                    validator: Validatorless.required(
                        'Telefone de Contato Obrigatorio'),
                    hintText: 'Digite seu telefone de contato para continuar',
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppDefaultTextformfield(
                    readOnly: !enableForm,
                    controller: documentEC,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter()
                    ],
                    title: 'Digite seu CPF',
                    validator: Validatorless.required('CPF Obrigatorio'),
                    hintText: 'Digite seu cpf para continuar',
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppDefaultTextformfield(
                    readOnly: !enableForm,
                    controller: cepEC,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CepInputFormatter(),
                    ],
                    title: 'CEP',
                    validator: Validatorless.required('CEP Obrigatorio'),
                    hintText: 'Digite seu cep para continuar',
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 3,
                        child: AppDefaultTextformfield(
                          readOnly: !enableForm,
                          controller: streetEC,
                          title: 'Endereço',
                          validator:
                              Validatorless.required('Endereço Obrigatorio'),
                          hintText: 'Digite seu endereço para continuar',
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Flexible(
                        flex: 1,
                        child: AppDefaultTextformfield(
                          readOnly: !enableForm,
                          controller: numberEC,
                          title: 'Numero',
                          validator:
                              Validatorless.required('Numero Obrigatorio'),
                          hintText: 'Digite seu numero para continuar',
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AppDefaultTextformfield(
                          readOnly: !enableForm,
                          controller: complementEC,
                          title: 'Complemento',
                          hintText:
                              'Digite seu complemento caso o tenhha  para continuar',
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: AppDefaultTextformfield(
                          readOnly: !enableForm,
                          controller: streetEC,
                          title: 'Estado',
                          validator:
                              Validatorless.required('Estado Obrigatorio'),
                          hintText:
                              'Digite a sigla do seu estado para continuar',
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AppDefaultTextformfield(
                          readOnly: !enableForm,
                          controller: cityEC,
                          title: 'Cidade',
                          validator:
                              Validatorless.required('Cidade Obrigatoria'),
                          hintText: 'Digite sua cidade para continuar',
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: AppDefaultTextformfield(
                          readOnly: !enableForm,
                          controller: districtEC,
                          title: 'Bairro',
                          validator:
                              Validatorless.required('Bairro Obrigatorio'),
                          hintText: 'Digite o bairro para continuar',
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppDefaultTextformfield(
                    readOnly: !enableForm,
                    controller: guardianEC,
                    title: 'Responsável',
                    hintText: 'Digite o responsaval caso tenha para continuar',
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppDefaultTextformfield(
                    readOnly: !enableForm,
                    controller: guardianIdentificationNumberEC,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter(),
                    ],
                    title: 'Documento de identidade',
                    hintText:
                        'Digite o documento de identidade do responsavel caso tenha para continuar',
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 32.5,
                  ),
                  Visibility(
                    visible: !enableForm,
                    replacement: AppDefaultEspecialButton(
                      tipoBotao: true,
                      onPressed: _salvarecontinuar,
                      label: !patientFound ? 'CONTINUAR' : 'SALVAR E CONTINUAR',
                      height: 48,
                      width: double.infinity,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: AppDefaultEspecialButton(
                            tipoBotao: false,
                            onPressed: () {
                              setState(() {
                                enableForm = true;
                              });
                            },
                            label: 'EDITAR',
                            height: 48,
                            width: sizeOf.width * .2,
                          ),
                        ),
                        const SizedBox(
                          width: 17,
                        ),
                        Expanded(
                          child: AppDefaultEspecialButton(
                            onPressed: _continuar,
                            label: 'CONTINUAR',
                            height: 48,
                            width: sizeOf.width * .2,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
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

      if (patientFound) {
        controller
            .updateAndNext(updatePatient(selfServiceController.model.patient!));
      } else {
        controller.savaAndNext(createPatientRegister());
      }
    }
  }

  void _continuar() {
    controller.patient = selfServiceController.model.patient;
    controller.goNextStep();
  }
}
