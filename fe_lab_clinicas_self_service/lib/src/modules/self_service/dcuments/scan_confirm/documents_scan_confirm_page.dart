import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/core/widget/app_default_especial_button.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/dcuments/scan_confirm/documents_scan_confirm_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/widgets/lab_clinicas_self_service_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:signals_flutter/signals_flutter.dart';

class DocumentsScanConfirmPage extends StatelessWidget {
  final controller = Injector.get<DocumentsScanConfirmController>();

  DocumentsScanConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    final foto = ModalRoute.of(context)!.settings.arguments as XFile;

    controller.pathRemoteStorage.listen(context, () {
      Navigator.of(context).pop();
      Navigator.of(context).pop(controller.pathRemoteStorage.value);
    });

    return Scaffold(
      appBar: LabClinicasSelfServiceAppBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(32),
            margin: const EdgeInsets.only(top: 18),
            constraints: BoxConstraints(maxWidth: sizeOf.width * .85),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: LabClinicasTheme.orangeColor)),
            child: Column(
              children: [
                Image.asset('assets/images/foto_confirm_icon.png'),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'CONFIRA SUA FOTO',
                  style: LabClinicasTheme.titleSmallStyle,
                ),
                const SizedBox(
                  height: 32,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SizedBox(
                    width: sizeOf.width * .48,
                    child: DottedBorder(
                      dashPattern: const [1, 10, 1, 3],
                      borderType: BorderType.RRect,
                      strokeWidth: 4,
                      radius: const Radius.circular(16),
                      color: LabClinicasTheme.orangeColor,
                      strokeCap: StrokeCap.square,
                      child: Image.file(File(foto.path)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    Expanded(
                      child: AppDefaultEspecialButton(
                        tipoBotao: false,
                        height: 48,
                        width: sizeOf.width * .2,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: LabClinicasTheme.blueColor,
                          side: const BorderSide(
                              color: LabClinicasTheme.blueColor),
                          fixedSize: const Size.fromHeight(48),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        label: 'TIRAR FOTO',
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: AppDefaultEspecialButton(
                        sizeBoxOn: false,
                        height: 48,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: LabClinicasTheme.blueColor,
                            fixedSize: const Size.fromHeight(48)),
                        onPressed: () async {
                          final imageBytes = await foto.readAsBytes();
                          final fileName = foto.name;
                          await controller.uploadImage(
                            imageBytes,
                            fileName,
                          );
                        },
                        label: 'SALVAR',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
