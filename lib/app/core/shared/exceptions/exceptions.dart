import 'i_app_exception.dart';

class ClientException extends IAppException {
  ClientException({required super.message, super.stackTrace});
}

enum HttpError { badRequest, notFound, serverError, unauthorized, invalidData }

class WeatherException extends IAppException {
  WeatherException({required super.message, super.stackTrace});
}
