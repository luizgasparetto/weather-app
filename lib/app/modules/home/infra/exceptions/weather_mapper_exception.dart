import '../../../../core/shared/exceptions/error_stacktrace.dart';
import 'infra_exception.dart';

class WeatherMapperException extends InfraException {
  WeatherMapperException({
    required super.message,
    required super.stackTrace,
  }) {
    ErrorStackTrace.printError(
      message: message,
      stackTrace: stackTrace!,
    );
  }
}
