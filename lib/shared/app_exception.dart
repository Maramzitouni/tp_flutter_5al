class AppException implements Exception {
  static AppException from(dynamic exception) {
    if (exception is AppException) return exception;
    return UnknownException();
  }

  @override
  String toString() => 'An application error occurred';
}

class UnknownException extends AppException {
  @override
  String toString() => 'An unknown error occurred';
}

class PostNotFoundException extends AppException {
  @override
  String toString() => 'The requested post was not found';
}

class NetworkException extends AppException {
  @override
  String toString() => 'A network error occurred. Please try again later';
}
