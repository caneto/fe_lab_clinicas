
import 'package:fe_lab_clinicas_self_service/src/modules/auth/login/login_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/auth/login/login_page.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/user/user_repository.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/user/user_repository_impl.dart';
import 'package:fe_lab_clinicas_self_service/src/services/user_login_service.dart';
import 'package:fe_lab_clinicas_self_service/src/services/user_login_service_impl.dart';
import 'package:flutter_getit/flutter_getit.dart';

class AuthModule extends FlutterGetItModule {

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<UserRepository>(
          (i) => UserRepositoryImpl(restClient: i()),
        ),
      ];

  @override
  String get moduleRouteName => '/auth';

  @override
  List<FlutterGetItPageRouter> get pages => [
        FlutterGetItPageRouter(
          name: '/login',
          builder: (_) => const LoginPage(),
          bindings: [
            Bind.lazySingleton<UserLoginService>(
              (i) => UserLoginServiceImpl(userRepository: i()),
            ),
            Bind.lazySingleton(
              (i) => LoginController(loginService: i()),
            ),
          ],
        ),
      ];
}
