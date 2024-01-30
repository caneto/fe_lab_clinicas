import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/local_storage_key.dart';

final class AuthInterceptor extends Interceptor {
  
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final RequestOptions(:headers, :extra) = options;

    const authHeaderKey = 'Authorization';
    headers.remove(authHeaderKey);

    if (extra case {'DIO_AUTH_KEY': true}) {
      final sp = await SharedPreferences.getInstance();

      headers.addAll({
        authHeaderKey: 'Bearer ${sp.getString(LocalStorageKey.accessToken)}'
      });
    }

    handler.next(options);
  }
}
