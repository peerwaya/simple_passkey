enum ErrorCode {
  credentialDomException,
  userCanceled,
  platformCanceled,
  invalidArgument,
  retry,
  missingConfiguration,
  unsupported,
  unknown;
}

class PassKeyException implements Exception {
  final ErrorCode code;
  final String? message;
  PassKeyException(this.code, {this.message});

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'message': message,
    };
  }

  @override
  String toString() {
    return '${toMap()}';
  }

  static PassKeyException fromString(code, {String? message}) {
    switch (code) {
      case "credential_dom_exception":
        return PassKeyException(ErrorCode.credentialDomException,
            message: message);
      case "user_canceled":
        return PassKeyException(ErrorCode.userCanceled, message: message);
      case "platform_canceled":
        return PassKeyException(ErrorCode.platformCanceled, message: message);
      case "retry":
        return PassKeyException(ErrorCode.retry, message: message);
      case "invalid_argument":
        return PassKeyException(ErrorCode.invalidArgument, message: message);
      case "missing_configuration":
        return PassKeyException(ErrorCode.missingConfiguration,
            message: message);
      case "unsupported":
        return PassKeyException(ErrorCode.unsupported, message: message);
      default:
        throw PassKeyException(ErrorCode.unknown, message: message);
    }
  }
}
