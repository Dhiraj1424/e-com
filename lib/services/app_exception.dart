class AppException implements Exception {
  final String? _message;
  final String? _prefix;
  AppException([
    this._prefix,
    this._message,
  ]);

  @override
  String toString() {
    return '$_prefix $_message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, '_message');
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Invalid request');
}

class UnAuthorizeException extends AppException {
  UnAuthorizeException([String? message])
      : super(message, 'UnAuthorize request, please enter correct password or email');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message])
      : super(message, 'Invalid Invalid Input');
}
