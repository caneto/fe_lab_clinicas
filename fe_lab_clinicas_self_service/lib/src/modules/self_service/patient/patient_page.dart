import 'package:brasil_fields/brasil_fields.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/core/widget/app_default_especial_button.dart';
import 'package:fe_lab_clinicas_self_service/src/core/widget/app_default_textformfield.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/patient/patient_form_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/widgets/lab_clinicas_self_service_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validatorless/validatorless.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({super.key});

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> with PatientFormController {
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    disposeForm();
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
                  Image.asset('assets/images/check_icon.png'),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    'Cadastro encontrado',
                    style: LabClinicasTheme.titleSmallStyle,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    'Confirma os dados do seu cadastro',
                    style: LabClinicasTheme.subTitleSmallStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  AppDefaultTextformfield(
                    controller: nameEC,
                    title: 'Nome paciente',
                    onFieldSubmitted: (_) => _continuarButton(),
                    validator: Validatorless.required('Nome Obrigatorio'),
                    hintText: 'Digite seu nome para continuar',
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppDefaultTextformfield(
                    controller: emailEC,
                    title: 'E-Mail',
                    onFieldSubmitted: (_) => _continuarButton(),
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
                    controller: phoneEC,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TelefoneInputFormatter(),
                    ],
                    title: 'Telefone de Contato',
                    onFieldSubmitted: (_) => _continuarButton(),
                    validator: Validatorless.required(
                        'Telefone de Contato Obrigatorio'),
                    hintText: 'Digite seu telefone de contato para continuar',
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppDefaultTextformfield(
                    controller: documentEC,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter()
                    ],
                    title: 'Digite seu CPF',
                    onFieldSubmitted: (_) => _continuarButton(),
                    validator: Validatorless.required('CPF Obrigatorio'),
                    hintText: 'Digite seu cpf para continuar',
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppDefaultTextformfield(
                    controller: cepEC,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CepInputFormatter(),
                    ],
                    title: 'CEP',
                    onFieldSubmitted: (_) => _continuarButton(),
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
                          controller: streetEC,
                          title: 'Endereço',
                          onFieldSubmitted: (_) => _continuarButton(),
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
                          controller: numberEC,
                          title: 'Numero',
                          onFieldSubmitted: (_) => _continuarButton(),
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
                          controller: complementEC,
                          title: 'Complemento',
                          onFieldSubmitted: (_) => _continuarButton(),
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
                          controller: streetEC,
                          title: 'Estado',
                          onFieldSubmitted: (_) => _continuarButton(),
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
                          controller: cityEC,
                          title: 'Cidade',
                          onFieldSubmitted: (_) => _continuarButton(),
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
                          controller: districtEC,
                          title: 'Bairro',
                          onFieldSubmitted: (_) => _continuarButton(),
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
                    controller: guardianEC,
                    title: 'Responsável',
                    onFieldSubmitted: (_) => _continuarButton(),
                    hintText: 'Digite o responsaval caso tenha para continuar',
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppDefaultTextformfield(
                    controller: guardianIdentificationNumberEC,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter(),
                    ],
                    title: 'Documento de identidade',
                    onFieldSubmitted: (_) => _continuarButton(),
                    hintText:
                        'Digite o documento de identidade do responsavel caso tenha para continuar',
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 32.5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AppDefaultEspecialButton(
                          tipoBotao: false,
                          onPressed: () {},
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
                          tipoBotao: true,
                          onPressed: () {},
                          label: 'CONTINUAR',
                          height: 48,
                          width: sizeOf.width * .2,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _continuarButton() {
    final formValid = _formKey.currentState?.validate() ?? false;

    if (formValid) {
      FocusScope.of(context).unfocus();
    }
  }
}
