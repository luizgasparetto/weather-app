import '../../../../core/shared/exceptions/i_app_exception.dart';

// TODO - Review this error's layer
class InfraException extends IAppException {
  InfraException({
    required super.message,
    required super.stackTrace,
  });
}
