import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/core/widget/app_default_elevatedbutton.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/widgets/self_service_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:validatorless/validatorless.dart';

class WhoIAmPage extends StatefulWidget {
  const WhoIAmPage({super.key});

  @override
  State<WhoIAmPage> createState() => _WhoIAmPageState();
}

class _WhoIAmPageState extends State<WhoIAmPage> {
  final selfServiceController = Injector.get<SelfServiceController>();
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _lastNameEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _lastNameEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: LabClinicasCoreAppBar(
        actions: [
          PopupMenuButton(
            child: const IconPopupMenuWidget(),
            itemBuilder: (context) {
              return [
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text('Finalizar Terminal'),
                ),
              ];
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (_, constrains) {
          return SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(minHeight: constrains.maxHeight),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background_login.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(40),
                  constraints: BoxConstraints(maxWidth: sizeOf.width * .8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Image.asset('assets/images/logo_vertical.png'),
                        const SizedBox(
                          height: 48,
                        ),
                        const Text(
                          'Bem-Vindo!',
                          style: LabClinicasTheme.titleStyle,
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                        SelfServiceTextformfield(
                          controller: _nameEC,
                          title: 'Digite seu nome',
                          onFieldSubmitted: (_) => _continuarButton(),
                          validator: Validatorless.required('Nome Obrigatório'),
                          hintText: 'Digite seu nome completo',
                          keyboardType: TextInputType.name,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        SelfServiceTextformfield(
                          controller: _lastNameEC,
                          title: 'Digite seu sobrenome',
                          onFieldSubmitted: (_) => _continuarButton(),
                          validator:
                              Validatorless.required('Sobrenome obrigatório'),
                          hintText: 'Digite seu sobre nome completo',
                          keyboardType: TextInputType.name,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        AppDefaultElevatedButton(
                          onPressed: _continuarButton,
                          label: 'CONTINUAR',
                          width: sizeOf.width * .8,
                          height: 48,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _continuarButton() {
    final formValid = _formKey.currentState?.validate() ?? false;

    if (formValid) {
      FocusScope.of(context).unfocus();
      //controller.login(_emailEC.text, _passwordEC.text);
    }
  }
}
