import 'package:camera/camera.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/core/widget/app_default_especial_button.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/widgets/lab_clinicas_self_service_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class DocumentsScanPage extends StatefulWidget {
  const DocumentsScanPage({super.key});

  @override
  State<DocumentsScanPage> createState() => _DocumentsScanPageState();
}

class _DocumentsScanPageState extends State<DocumentsScanPage> {
  late CameraController cameraController;

  @override
  void initState() {
    cameraController = CameraController(
      Injector.get<List<CameraDescription>>().first,
      ResolutionPreset.ultraHigh,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);

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
                Image.asset('assets/images/cam_icon.png'),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'TIRAR A FOTO AGORA',
                  style: LabClinicasTheme.titleSmallStyle,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Posicione o documento dentro do quadrado abaixo e aperte o botão para tirar a foto',
                  textAlign: TextAlign.center,
                  style: LabClinicasTheme.subTitleSmallStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                FutureBuilder(
                  future: cameraController.initialize(),
                  builder: (context, snapshot) {
                    switch (snapshot) {
                      case AsyncSnapshot(
                          connectionState:
                              ConnectionState.waiting || ConnectionState.active
                        ):
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      case AsyncSnapshot(connectionState: ConnectionState.done):
                        if (cameraController.value.isInitialized) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: SizedBox(
                              width: sizeOf.width * .45,
                              child: CameraPreview(
                                cameraController,
                                child: DottedBorder(
                                  dashPattern: const [1, 10, 1, 3],
                                  borderType: BorderType.RRect,
                                  strokeWidth: 4,
                                  radius: const Radius.circular(16),
                                  color: LabClinicasTheme.orangeColor,
                                  strokeCap: StrokeCap.square,
                                  child: const SizedBox.expand(),
                                ),
                              ),
                            ),
                          );
                        }
                    }
                    return const Center(
                      child: Text('Erro ao carregar camerca'),
                    );
                  },
                ),
                const SizedBox(
                   height: 30,
                ),
                AppDefaultEspecialButton(
                  sizeBoxOn: true,
                  width: sizeOf.width *.8,
                  height: 48,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: LabClinicasTheme.orangeColor,
                      fixedSize: const Size.fromHeight(48)),
                  onPressed: () {},
                  label: 'TIRAR FOTO',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
