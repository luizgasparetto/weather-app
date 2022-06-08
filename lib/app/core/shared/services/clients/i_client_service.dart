abstract class IClientService {
  Future<ResponseService> get(String url);
}

class ResponseService {
  final dynamic data;

  ResponseService({required this.data});
}
