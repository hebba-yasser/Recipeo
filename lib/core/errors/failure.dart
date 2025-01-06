import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class AuthErrorMessages {
  // SIGN UP EXCEPTIONS
  static const String emailAlreadyInUse =
      'An account already exists for that email. Please use a different email or sign in.';
  static const String weakPassword =
      'The password is too weak. Please use a stronger password.';

  // SIGN IN EXCEPTIONS
  static const String userNotFound =
      'No account found with that email. Please check the email or sign up.';
  static const String wrongPassword =
      // 'The password you entered is incorrect. Please try again.'
      'The email or password you entered is incorrect. Please try again.';
  static const String invalidEmail = 'Please enter a valid email address.';

  // BOTH SIGN UP & SIGN IN
  static const String userDisabled =
      'Your account has been disabled. Please contact support for assistance.';
  static const String operationNotAllowed =
      'This operation is not allowed. Please contact support.';
  static const String connectionError =
      'Could not connect to the server. Please check your internet connection.';
  static const String unknownError =
      'An unknown error occurred. Please try again later.';

  // PHONE AUTH EXCEPTIONS
  static const String invalidVerificationCode =
      'The verification code you entered is invalid. Please try again.';
  static const String invalidVerificationId =
      'The verification ID is invalid. Please check and try again.';

  // CREDENTIAL EXCEPTIONS
  static const String accountExistsWithDifferentCredential =
      // 'An account already exists with a different sign-in method. Please sign in using that method.';
      'The email or password you entered is incorrect. Please try again.';

  static const String invalidCredential =
      // 'The provided credential is invalid or has expired. Please try again.';
      'The email or password you entered is incorrect. Please try again.';
}

class FirebaseFailure extends Failure {
  FirebaseFailure(super.errMessage);

  factory FirebaseFailure.fromFirebaseAuthException(
      FirebaseAuthException exception) {
    return FirebaseFailure(_mapFirebaseAuthExceptionToMessage(exception));
  }

  static String _mapFirebaseAuthExceptionToMessage(
      FirebaseAuthException exception) {
    switch (exception.code) {
      // SIGN IN EXCEPTIONS
      case 'user-not-found':
        return AuthErrorMessages.userNotFound;
      case 'wrong-password':
        return AuthErrorMessages.wrongPassword;
      case 'invalid-email':
        return AuthErrorMessages.invalidEmail;

      // SIGN UP EXCEPTIONS
      case 'email-already-in-use':
        return AuthErrorMessages.emailAlreadyInUse;
      case 'weak-password':
        return AuthErrorMessages.weakPassword;

      // BOTH SIGN IN & SIGN UP
      case 'user-disabled':
        return AuthErrorMessages.userDisabled;
      case 'operation-not-allowed':
        return AuthErrorMessages.operationNotAllowed;

      // NETWORK ISSUES
      case 'network-request-failed':
        return AuthErrorMessages.connectionError;

      // CREDENTIALS
      case 'account-exists-with-different-credential':
        return AuthErrorMessages.accountExistsWithDifferentCredential;
      case 'invalid-credential':
        return AuthErrorMessages.invalidCredential;

      // PHONE AUTH EXCEPTIONS
      case 'invalid-verification-code':
        return AuthErrorMessages.invalidVerificationCode;
      case 'invalid-verification-id':
        return AuthErrorMessages.invalidVerificationId;

      default:
        return AuthErrorMessages.unknownError;
    }
  }
}

class ErrorMessages {
  static const String connectionTimeout = 'Connection timeout with the server.';
  static const String sendTimeout = 'Send timeout with the server.';
  static const String receiveTimeout = 'Receive timeout with the server.';
  static const String requestCancelled = 'Request to the server was cancelled.';
  static const String noInternetConnection = 'No internet connection.';
  static const String unexpectedError =
      'Unexpected error occurred. Please try again.';
  static const String connectionError =
      'Connection error, please check your network.';
  static const String notFound = 'Resource not found. Please try later.';
  static const String internalServerError =
      'Internal server error. Please try again later.';
  static const String unauthorized = 'Authorization error.';
  static const String unknownError = 'An unknown error occurred.';
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    return ServerFailure(_mapDioExceptionToMessage(dioException));
  }

  static String _mapDioExceptionToMessage(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ErrorMessages.connectionTimeout;

      case DioExceptionType.sendTimeout:
        return ErrorMessages.sendTimeout;

      case DioExceptionType.receiveTimeout:
        return ErrorMessages.receiveTimeout;

      case DioExceptionType.badResponse:
        return _handleResponseError(
            dioException.response?.statusCode, dioException.response?.data);

      case DioExceptionType.cancel:
        return ErrorMessages.requestCancelled;

      case DioExceptionType.connectionError:
        return dioException.message != null &&
                dioException.message!.contains('SocketException')
            ? ErrorMessages.noInternetConnection
            : ErrorMessages.connectionError;

      case DioExceptionType.unknown:
      default:
        return ErrorMessages.unexpectedError;
    }
  }

  static String _handleResponseError(int? statusCode, dynamic response) {
    if (statusCode == null) {
      return ErrorMessages.unknownError;
    }

    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        return response?['error']?['message'] ?? ErrorMessages.unauthorized;
      case 404:
        return ErrorMessages.notFound;
      case 500:
        return ErrorMessages.internalServerError;
      default:
        return ErrorMessages.unexpectedError;
    }
  }
}

class SupabaseFailure extends Failure {
  SupabaseFailure(super.errMessage);

  factory SupabaseFailure.fromSupabaseError(error) {
    return SupabaseFailure(_mapSupabaseErrorToMessage(error));
  }

  static String _mapSupabaseErrorToMessage(error) {
    switch (error.code) {
      case '401':
        return 'Authentication error. Please check your credentials or log in again.';
      case '403':
        return 'You do not have permission to access this resource.';
      case '404':
        return 'Resource not found.';
      case '500':
        return 'Internal server error. Please try again later.';
      default:
        return 'An unknown error occurred. Please try again later.';
    }
  }
}
