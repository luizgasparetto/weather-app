import '../../../../core/shared/errors/error_stacktrace.dart';
import 'infra_exceptions.dart';

class WeatherMapperException extends InfraWeatherException {
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
