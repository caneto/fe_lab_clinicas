import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix_poc/shared/button/custom_button.variant.dart';
import 'package:mix_poc/style/base_style.dart';

class CustomButtonStyle {
  CustomButtonStyle(this.type, this.size);

  final CustomButtonType type;
  final CustomButtonSize size;

  Style container(double screen) => Style(
        borderRadius(8),
        CustomButtonSize.large(
          width(screen),
          height(72),
        ),
        CustomButtonSize.medium(
          width(screen * .5),
          height(72),
        ),
        CustomButtonType.primary(
          backgroundColor(BaseStyle.blueColor),
        ),
      ).applyVariants([type, size]);

   Style lebel() => Style(
    text.style.color.white(),
    text.style.fontWeight.w700(),
    text.textAlign.center(),
    text.style.fontFamily('Monteserrant'),
    align(alignment: Alignment.center),
    CustomButtonSize.medium(
      text.style.fontSize(14)
    ),
    CustomButtonSize.large(
      text.style.fontSize(18)
    ),
    CustomButtonType.primary(
      text.style.color.white()
    ),
    CustomButtonType.link(
      text.style.color.black(),
      text.style.decoration.underline(),
    )
   ).applyVariants([type, size]);
}
