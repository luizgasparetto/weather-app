import '../../../../core/shared/exceptions/error_stacktrace.dart';
import 'infra_exception.dart';

class ForecastMapperException extends InfraException {
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
