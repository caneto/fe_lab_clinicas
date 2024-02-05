import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/core/widget/app_default_elevatedbutton.dart';
import 'package:fe_lab_clinicas_self_service/src/core/widget/app_default_textformfield.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:validatorless/validatorless.dart';

class WhoIAmPage extends StatefulWidget {
  const WhoIAmPage({super.key});

  @override
  State<WhoIAmPage> createState() => _WhoIAmPageState();
}

class _WhoIAmPageState extends State<WhoIAmPage> {
  final selfServiceController = Injector.get<SelfServiceController>();
  final _formKey = GlobalKey<FormState>();
  final _firstNameEC = TextEditingController();
  final _lastNameEC = TextEditingController();

  @override
  void dispose() {
    _firstNameEC.dispose();
    _lastNameEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        _firstNameEC.text = '';
        _lastNameEC.text = '';
        selfServiceController.clearForm();
      },
      child: Scaffold(
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
              onSelected: (value) async {
                if(value == 1) {
                  final nav = Navigator.of(context);
                  await SharedPreferences.getInstance().then((sp) => sp.clear());
                  nav.pushNamedAndRemoveUntil('/', (route) => false);
                }
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
                          AppDefaultTextformfield(
                            controller: _firstNameEC,
                            title: 'Digite seu nome',
                            onFieldSubmitted: (_) => _continuarButton(),
                            validator: Validatorless.required('Nome Obrigatório'),
                            hintText: 'Digite seu nome completo',
                            keyboardType: TextInputType.name,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          AppDefaultTextformfield(
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
      ),
    );
  }

  void _continuarButton() {
    final formValid = _formKey.currentState?.validate() ?? false;

    if (formValid) {
      FocusScope.of(context).unfocus();
      selfServiceController.setWhoIAmStepAndNext(_firstNameEC.text, _lastNameEC.text);
    }
  }
}
