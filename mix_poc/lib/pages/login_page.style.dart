import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class LoginPageStyle {
  const LoginPageStyle();

  Style backgroudConteiner(double height) => Style(
        minHeight(height),
        box.decoration.image(
          const AssetImage('assets/images/background_login.png'),
        ),
        box.decoration.image.fit(BoxFit.cover),
      );
}
