import '../../../../core/shared/exceptions/error_stacktrace.dart';
import 'infra_exception.dart';

class RepositoryException extends InfraException {
  RepositoryException({
    required super.message,
    required super.stackTrace,
  }) {
    ErrorStackTrace.printError(
      message: message,
      stackTrace: stackTrace!,
    );
  }
}
