abstract class IAppException implements Exception {
  final String message;
  final StackTrace? stackTrace;
  final String? code;

  IAppException({
    required this.message,
    this.stackTrace,
    this.code,
  });
}
