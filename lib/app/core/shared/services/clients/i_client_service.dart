import 'package:dio/dio.dart';

abstract class IClientService {
  Future<ResponseService> get(String url);
}

class ResponseService extends Response {
  ResponseService({
    super.data,
    required super.requestOptions,
    super.statusCode,
  });
}

class RequestOptionsService extends RequestOptions {
  RequestOptionsService({required super.path});
}
