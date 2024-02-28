import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix_poc/pages/login_page.style.dart';
import 'package:mix_poc/shared/button/custom_buttom.dart';
import 'package:mix_poc/shared/button/custom_button.variant.dart';
import 'package:mix_poc/style/base_style.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  final pageStyle = const LoginPageStyle();

  @override
  Widget build(BuildContext context) {
    var sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Box(
          style: pageStyle.backgroudConteiner(sizeOf.height),
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
                    TextFormField(),
                    TextFormField(),
                    CustomButtom(
                      title: 'Entrar',
                      onPress: () {},
                      size: CustomButtonSize.medium,
                      type: CustomButtonType.link,
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
