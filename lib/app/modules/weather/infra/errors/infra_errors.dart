import '../../../../core/shared/errors/error_stacktrace.dart';
import '../../../../core/shared/errors/i_app_exception.dart';

abstract class InfraWeatherError extends IAppException {
  InfraWeatherError({
    required super.message,
    required super.stackTrace,
  });
}

class InfraWeatherRepositoryError extends InfraWeatherError {
  InfraWeatherRepositoryError({
    required super.message,
    required super.stackTrace,
  }) {
    ErrorStackTrace.printError(
      message: message,
      stackTrace: stackTrace!,
    );
  }
}

class WeatherMapperException extends InfraWeatherError {
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

class ForecastMapperException extends InfraWeatherError {
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
