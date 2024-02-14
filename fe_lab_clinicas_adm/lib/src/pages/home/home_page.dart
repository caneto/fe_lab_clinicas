import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: LabClinicasAppBar(),
      body: Center(
        child: Container(
          width: sizeOf.width * .4,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: LabClinicasTheme.orangeColor),
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Bem-Vindo', style: LabClinicasTheme.titleStyle,)
            ],
          ),
        ),
      ),
    );
  }
}
