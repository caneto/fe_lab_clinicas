import 'package:flutter/material.dart';

class AppDefaultEspecialButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double width;
  final double height;
  final String label;
  final bool tipoBotao;

  const AppDefaultEspecialButton({
    required this.onPressed,
    required this.label,
    required this.width,
    required this.tipoBotao,
    this.height = 66,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: tipoBotao
          ? ElevatedButton(
              onPressed: onPressed,
              child: Text(
                label,
              ),
            )
          : OutlinedButton(
              onPressed: onPressed,
              child: Text(
                label,
              ),
            ),
    );
  }
}
