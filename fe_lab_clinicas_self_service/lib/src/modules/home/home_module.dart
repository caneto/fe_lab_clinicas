import 'package:fe_lab_clinicas_self_service/src/modules/home/home_page.dart';
import 'package:flutter_getit/flutter_getit.dart';

class HomeModule extends FlutterGetItModule {
  @override
  String get moduleRouteName => '/home';

  @override
  List<FlutterGetItPageRouter> get pages => [
        FlutterGetItPageRouter(
          name: '/',
          builder: (_) => const HomePage(),
        ),
      ];
}
