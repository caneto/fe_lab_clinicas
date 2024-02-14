
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'home_page.dart';

class HomeRouter extends FlutterGetItPageRouter {
  const HomeRouter({super.key});

  @override
  List<Bind<Object>> get bindings => [];

  @override
  String get routeName => '/home';

  @override
  WidgetBuilder get view => (_) => const HomePage();
  
}