import 'package:dio/dio.dart' as dio;

class DioOptions {
  static dio.Options fetchDataOptions({String? token}) {
    return dio.Options(
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 10),
      responseType: dio.ResponseType.json,
      contentType: dio.Headers.jsonContentType,
      headers: {"Authorization": "Bearer $token"},
    );
  }

  static dio.Options sendDataOptions({String? token}) {
    return dio.Options(
      sendTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 15),
      responseType: dio.ResponseType.json,
      contentType: dio.Headers.multipartFormDataContentType,
      headers: {
        "Authorization": "Bearer $token",
      },
    );
  }

  static final dio.Options downloadDataOptions = dio.Options(
    sendTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 15),
    responseType: dio.ResponseType.stream,
  );
}
