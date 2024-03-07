import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix_poc/pages/login_page.style.dart';
import 'package:mix_poc/shared/button/custom_buttom.dart';
import 'package:mix_poc/shared/button/custom_button.variant.dart';
import 'package:mix_poc/shared/textformfields/text_form_field_custom.dart';
import 'package:mix_poc/style/base_style.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final formKey = GlobalKey<FormState>();
  final loginEC = TextEditingController();
  final pageStyle = const LoginPageStyle();

  @override
  Widget build(BuildContext context) {
    var sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Box(
          style: pageStyle.backgroudConteiner(sizeOf.height),
          child: Form(
            key: formKey,
            child: Center(
              child: Box(
                  style: Style(
                    maxWidth(sizeOf.width * .8),
                    backgroundColor.white(),
                    borderRadius.circular(16),
                    padding.all(40),
                  ),
                  child: VBox(
                    style: Style(flex.gap(32)),
                    children: [
                      StyledText('Login', style: BaseStyle.titleStyle()),
                      TextFormFieldCustom(
                        controller: loginEC,
                        width: 295,
                        height: 43,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Login não preechido';
                          }
                          return null;
                        },
                        label: 'Login',
                      ),
                      TextFormField(
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Senha não preechido';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          isCollapsed: false,
                        ),
                      ),
                      CustomButtom(
                        title: 'Entrar',
                        onPress: () {
                          formKey.currentState?.validate() ?? false;
                        },
                        size: CustomButtonSize.medium,
                        type: CustomButtonType.primary,
                      )
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
