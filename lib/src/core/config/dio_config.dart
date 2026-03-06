import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class DioConfig extends Interceptor {
  static final Dio client = Dio(
    BaseOptions(baseUrl: 'https://api-service.fintechhub.uz',
      sendTimeout: Duration(minutes: 2),
      receiveTimeout: Duration(minutes: 2),
      connectTimeout: Duration(minutes: 2),
    ),
  );

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    print("Interceptor error dio: $err");

    if(err.response?.statusCode == 401) {
      //expired -> muddati o'tgan
      try {
        final newToken = await refresh();
        if(newToken != null) {
          await GetStorage().write("accessToken", newToken);
          return handler.next(err);  // oxirgi zaprosni davom ettiradi
        }
      } catch(e) {
        return handler.next(err);
      }
    }

  }

  Future<String?> refresh() async {
    try {
      final res = await client.post(
        "/token/refresh/",
        data: {"refresh": GetStorage().read("refreshToken")},
      );

      if(res.statusCode! >= 200 && res.statusCode! < 300) {
        return res.data["access"];
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
