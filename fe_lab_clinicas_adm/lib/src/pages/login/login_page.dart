import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with MessageViewMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final controller = Injector.get<LoginController>();
  late final EffectCleanup effectCleanup;

  @override
  void initState() {
    messageListener(controller);
    effectCleanup = effect(() {
      if (controller.logged) {
        Navigator.of(context).pushReplacementNamed('/home');
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    effectCleanup();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(minHeight: sizeOf.height),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_login.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(40),
              constraints: BoxConstraints(maxWidth: sizeOf.width * .4),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text(
                      'Login',
                      style: LabClinicasTheme.titleStyle,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    AppDefaultTextformfield(
                      title: "Email",
                      hintText: 'Digite um E-mail valido',
                      controller: _emailEC,
                      onFieldSubmitted: (_) => _enterButton(),
                      validator: Validatorless.multiple([
                        Validatorless.required('Email Obrigatório'),
                        Validatorless.email('Email inválido')
                      ]),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Watch(
                      (_) {
                        return AppDefaultTextformfield(
                          title: 'Password',
                          obscureControll:
                              true, // habilita o obscure e seus funcões
                          obscureText: controller.obscurePassword,
                          controller: _passwordEC,
                          validator:
                              Validatorless.required('Senha obrigatória'),
                          hintText: 'Digite uma senha valida',
                          passwordToggle: () {
                            controller.passwordToggle();
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    AppDefaultEspecialButton(
                      tipoBotao: true,
                      onPressed: _enterButton,
                      label: 'ENTRAR',
                      width: sizeOf.width * .8,
                      height: 48,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _enterButton() {
    final formValid = _formKey.currentState?.validate() ?? false;

    if (formValid) {
      FocusScope.of(context).unfocus();
      controller.login(_emailEC.text, _passwordEC.text);
    }
  }
}
