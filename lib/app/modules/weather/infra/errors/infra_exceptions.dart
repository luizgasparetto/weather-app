import '../../../../core/shared/errors/error_stacktrace.dart';
import '../../../../core/shared/errors/i_app_exception.dart';

class InfraWeatherException extends IAppException {
  InfraWeatherException({
    required super.message,
    required super.stackTrace,
  });
}

class InfraWeatherRepositoryException extends InfraWeatherException {
  InfraWeatherRepositoryException({
    required super.message,
    required super.stackTrace,
  }) {
    ErrorStackTrace.printError(
      message: message,
      stackTrace: stackTrace!,
    );
  }
}
