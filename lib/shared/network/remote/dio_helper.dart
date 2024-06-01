import 'package:dio/dio.dart';
import '../../constants/constants.dart';


class DioHelper {
  static Dio? dio;


  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.BASE_URL,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  // Response == json in Dio
  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async
  {
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

}