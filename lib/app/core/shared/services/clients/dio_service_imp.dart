import 'package:dio/dio.dart';

import '../../exceptions/client_exception.dart';
import 'i_client_service.dart';

class DioServiceImp implements IClientService {
  final Dio dio;

  DioServiceImp(this.dio);

  @override
  Future<ResponseService> get(String url) async {
    try {
      final result = await dio.get(url);

      return ResponseService(data: result.data);
    } on DioError catch (error, stackTrace) {
      throw ClientException(message: error.message, stackTrace: stackTrace);
    }
  }
}
