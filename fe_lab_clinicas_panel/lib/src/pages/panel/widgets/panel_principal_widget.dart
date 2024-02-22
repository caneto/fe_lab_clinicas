import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';

class PanelPrincipalWidget extends StatelessWidget {
  const PanelPrincipalWidget({
    super.key,
    required this.passwordLabel,
    required this.password,
    required this.deskNumber,
    required this.labelColor,
    required this.buttonColor,
  });

  final String passwordLabel;
  final String password;
  final String deskNumber;

  final Color labelColor;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: LabClinicasTheme.orangeColor),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Text(
              passwordLabel,
              style: LabClinicasTheme.titleStyle.copyWith(color: labelColor),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                password,
                style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Guichê',
              style: LabClinicasTheme.titleStyle.copyWith(color: labelColor),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                deskNumber,
                style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
