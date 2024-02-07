import 'package:flutter/material.dart';

class AppDefaultEspecialButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double width;
  final double height;
  final String label;
  final bool tipoBotao;
  final bool sizeBoxOn;
  final ButtonStyle? style;

  const AppDefaultEspecialButton({
    required this.onPressed,
    required this.label,
    this.tipoBotao = true,
    this.sizeBoxOn = true,
    this.width = 0,
    this.height = 66,
    this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return sizeBoxOn
        ? SizedBox(width: width, height: height, child: opcaoBotao(tipoBotao))
        : opcaoBotao(tipoBotao);
  }

  Widget opcaoBotao(bool tipoBotao) {
    return tipoBotao
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
          );
  }
}
