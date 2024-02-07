import 'package:flutter/material.dart';

class AppDefaultEspecialButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double width;
  final double height;
  final String label;
  final bool tipoBotao;
  final ButtonStyle? style;

  const AppDefaultEspecialButton({
    required this.onPressed,
    required this.label,
    required this.width,
    required this.tipoBotao,
    this.height = 66,
    this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: tipoBotao
          ? ElevatedButton(
              style: style,
              onPressed: onPressed,
              child: Text(
                label,
              ),
            )
          : OutlinedButton(
              style: style,
              onPressed: onPressed,
              child: Text(
                label,
              ),
            ),
    );
  }
}
