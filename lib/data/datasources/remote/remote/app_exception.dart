class AppException implements Exception {
  final String _message;
  final String _prefix;

  AppException(this._message, this._prefix);

  @override
  String toString() {
    return "$_prefix: $_message";
  }
}

class InternetException extends AppException {
  InternetException([String? message]) : super(message ?? "", 'No Internet');
}

class RequestTimeoutException extends AppException {
  RequestTimeoutException([String? message]) : super(message ?? "", 'No Internet');
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message]) : super(message ?? "", "Unauthorised Request");
}

class ServerException extends AppException {
  ServerException([String? message]) : super(message ?? "", 'Internal Server Error');
}

class InvalidUrlException extends AppException {
  InvalidUrlException([String? message]) : super(message ?? "", 'Invalid url exception');
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message ?? "", 'Something went wrong');
}
