import 'package:flutter/material.dart';

class AppDefaultElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double width;
  final double height;
  final String label;

  const AppDefaultElevatedButton({
    required this.onPressed,
    required this.label,
    required this.width,
    this.height = 66,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
        ),
      ),
    );
  }
}
