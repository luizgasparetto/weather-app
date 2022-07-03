import '../../../../core/shared/errors/error_stacktrace.dart';
import 'infra_exceptions.dart';

class ForecastMapperException extends InfraWeatherException {
  ForecastMapperException({
    required super.message,
    required super.stackTrace,
  }) {
    ErrorStackTrace.printError(
      message: message,
      stackTrace: stackTrace!,
    );
  }
}
