import '../../../../core/shared/errors/i_app_exception.dart';

abstract class DomainWeatherErrors extends IAppException {
  DomainWeatherErrors({
    required super.message,
    super.stackTrace,
  });
}

class InvalidPlaceDomainError extends DomainWeatherErrors {
  InvalidPlaceDomainError({
    required super.message,
    super.stackTrace,
  });
}

class ErrorLoadedDomainError extends DomainWeatherErrors {
  ErrorLoadedDomainError({
    required super.message,
    super.stackTrace,
  });
}
