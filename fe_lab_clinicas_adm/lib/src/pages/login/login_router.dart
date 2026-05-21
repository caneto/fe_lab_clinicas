import 'package:flutter_getit/flutter_getit.dart';

import '../../repositories/user/user_repository.dart';
import '../../repositories/user/user_repository_impl.dart';
import '../../services/login/user_login_service.dart';
import '../../services/login/user_login_service_impl.dart';
import 'login_controller.dart';
import 'login_page.dart';

class LoginRouter extends FlutterGetItPageRouter {
  LoginRouter()
      : super(
          name: '/login',
          bindings: [
            Bind.lazySingleton<UserRepository>((i) => UserRepositoryImpl(restClient: i())),
            Bind.lazySingleton<UserLoginService>((i) => UserLoginServiceImpl(userRepository: i())),
            Bind.lazySingleton((i) => LoginController(loginService: i())),
          ],
          builder: (_) => const LoginPage(),
        );
}