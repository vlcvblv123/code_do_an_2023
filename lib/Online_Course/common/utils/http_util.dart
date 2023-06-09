import 'package:dio/dio.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() {
    return _instance;
  }
  late Dio dio;

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
        baseUrl: "http://192.168.16.103:8000/",
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout:Duration(seconds: 5),
        headers: {},
        contentType: "application/json: charset = utf-8",
        responseType: ResponseType.json);
    dio = Dio(options);
  }
  Future post(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    var response =
        await dio.post(path, data: data, queryParameters: queryParameters);
    print("my response data is${response.toString()}");
    print("my status code is ${response.statusCode.toString()}");
    return response.data;
  }
}
