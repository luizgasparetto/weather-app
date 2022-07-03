import 'package:dio/dio.dart';

import '../../errors/exceptions.dart';
import 'i_client_service.dart';

class DioClientImp implements IClientService {
  final Dio dio;

  DioClientImp(this.dio);

  @override
  Future<ResponseService> get(String url) async {
    try {
      final response = await dio.get(url);

      return ResponseService(
        data: response.data,
        requestOptions: response.requestOptions,
        statusCode: response.statusCode,
      );
    } on DioError catch (error, stackTrace) {
      throw ClientException(message: error.message, stackTrace: stackTrace);
    }
  }
}

class RequestOptionsService extends RequestOptions {
  RequestOptionsService({required super.path});
}
