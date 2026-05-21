import 'package:asyncstate/asyncstate.dart';
import 'package:fe_lab_clinicas_core/src/loader/lab_clienicas_loader.dart';
import 'package:fe_lab_clinicas_core/src/theme/lab_clinicas_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class LabClinicasCoreConfig extends StatefulWidget {
  const LabClinicasCoreConfig({
    super.key,
    this.binding,
    this.pages,
    this.pagesBuilders,
    this.modules,
    required this.title,
    this.didStart,
  });

  final ApplicationBindings? binding;
  final List<FlutterGetItPageRouter>? pages;
  final List<FlutterGetItPageRouter>? pagesBuilders;
  final List<FlutterGetItModule>? modules;
  final String title;
  final VoidCallback? didStart;

  @override
  State<LabClinicasCoreConfig> createState() => _LabClinicasCoreConfigState();
}

class _LabClinicasCoreConfigState extends State<LabClinicasCoreConfig> {
  var _didStartCalled = false;

  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
      bindings: widget.binding,
      pagesRouter: [...widget.pages ?? [], ...widget.pagesBuilders ?? []],
      modules: widget.modules,
      builder: (context, routes, isReady) {
        return AsyncStateBuilder(
          loader: LabClienicasLoader(),
          builder: (navigatorObserver) {
            if (isReady && !_didStartCalled && widget.didStart != null) {
              _didStartCalled = true;
              widget.didStart!();
            }
            return MaterialApp(
              theme: LabClinicasTheme.lightTheme,
              darkTheme: LabClinicasTheme.darkTheme,
              navigatorObservers: [navigatorObserver],
              debugShowCheckedModeBanner: false,
              routes: routes,
              title: widget.title,
            );
          },
        );
      },
    );
  }
}
