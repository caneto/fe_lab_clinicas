import 'dart:ui';

import 'package:mix/mix.dart';

class BaseStyle {
  static const orangeColor = Color(0xFFFFAE45);
  static const lightOrangeColor = Color(0xFFFFEFE9);
  static const blueColor = Color(0xFF01BDD6);

  static Style titleStyle() => Style(
        text.style.color(BaseStyle.blueColor),
        text.style.fontSize(32),
        text.style.fontWeight.w900(),
      );
}
