import 'i_app_exception.dart';

class ClientException extends IAppException {
  ClientException({
    required super.message,
    super.stackTrace,
  });
}
