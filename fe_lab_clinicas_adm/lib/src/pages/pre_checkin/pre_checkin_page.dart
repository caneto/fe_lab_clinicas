import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';

class PreCheckinPage extends StatelessWidget {
  const PreCheckinPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: LabClinicasAppBar(),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            padding: const EdgeInsets.all(32),
            margin: const EdgeInsets.only(top: 18),
            constraints: BoxConstraints(maxWidth: sizeOf.width * .85),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: LabClinicasTheme.orangeColor),
            ),
            child: Column(
              children: [
                Image.asset('assets/images/patient.png')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
