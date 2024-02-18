
import 'package:fe_lab_clinicas_adm/src/pages/pre_checkin/pre_checkin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class PreCheckinRouter extends FlutterGetItPageRouter {
  const PreCheckinRouter({super.key});

  @override
  List<Bind<Object>> get bindings => [];

  @override
  String get routeName => '/pre-checkin';

  @override
  WidgetBuilder get view => (_) => const PreCheckinPage();
  
}