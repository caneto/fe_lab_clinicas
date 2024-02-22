
import 'package:fe_lab_clinicas_panel/src/pages/panel/panel_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class PanelRouter extends FlutterGetItPageRouter {
  const PanelRouter({super.key});
  
  @override
  List<Bind<Object>> get bindings => [];

  @override
  String get routeName => '/panel';

  @override
  WidgetBuilder get view => (_) => const PanelPage();
  
}