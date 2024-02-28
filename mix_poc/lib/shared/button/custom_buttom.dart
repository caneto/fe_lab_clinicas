import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix_poc/shared/button/custom_button.style.dart';
import 'package:mix_poc/shared/button/custom_button.variant.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    super.key,
    required this.title,
    required this.onPress,
    this.type = CustomButtonType.primary,
    this.size = CustomButtonSize.large,
  });

  final String title;
  final VoidCallback onPress;
  final CustomButtonType type;
  final CustomButtonSize size;

  @override
  Widget build(BuildContext context) {
    final style = CustomButtonStyle(type, size);
    var sizeOf = MediaQuery.sizeOf(context);

    return PressableBox(
      style: style.container(sizeOf.width),
      onPress: onPress,
      child: StyledText(title,style: style.lebel(),),
    );
  }
}
