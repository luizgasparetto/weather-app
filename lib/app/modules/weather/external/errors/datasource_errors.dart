import '../../../../core/shared/errors/i_app_exception.dart';

abstract class DatasourceWeatherErrors extends IAppException {
  DatasourceWeatherErrors({
    required super.message,
    super.stackTrace,
  });
}

class DatasourceLoadedError extends DatasourceWeatherErrors {
  DatasourceLoadedError({required super.message, super.stackTrace});
}
