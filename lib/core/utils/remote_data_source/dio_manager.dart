import 'package:dio/dio.dart';

class DioManager {
  static Dio getDio() {
    Dio dio = Dio();

//TODO: enviroment araştıtılacak ve eklenecek,  base url enviromenttan çağrılacak, enviroment classı oluşturulacak,

//TODO: socket interceptor araştırılacaktır

    dio.options.baseUrl = 'https://api.testsoftware.site/';


    dio.options.validateStatus = (status) {
      return true;
    };

    dio.options.headers = {
      "Content-Type": "application/json",
      // "Authorization": "Bearer $token",
      

      //TODO: token eklenebilir
    };

    dio.options.queryParameters = {
      //TODO: dil desteği için kullanılabilir.
    };

    dio.options.responseType = ResponseType.plain;

    // dio.interceptors.add(
    //     LogInterceptor(requestBody: true, error: true, responseBody: true));

    return dio;
  }
}
