import 'package:dio/dio.dart';
import 'package:roqqu_test/utils/utils.dart';

import 'package:roqqu_test/core/errors/errors.dart';

import 'get_error.dart';

const _unkownErrorString = "An error occured, please try again. ";

class ConflictException extends DioException implements Failure {
  final _logger = appLogger(ConflictException);
  final RequestOptions request;
  final Response? serverResponse;
  final String errorKey;
  ConflictException(this.request, [this.serverResponse, this.errorKey = ''])
      : super(requestOptions: request, response: serverResponse);

  @override
  String toString() {
    return "Error was:\nTitle: $title\nMessage: $message ";
  }

  @override
  String get title {
    if (serverResponse == null) {
      return "Bad Request";
    }
    return serverResponse?.data['message'] ?? "";
  }

  @override
  String get message {
    _logger.d(serverResponse?.data);
    if (serverResponse == null) {
      return "An unknown error occurred ";
    } else {
      return getErrorInfo(serverResponse?.data, errorKey);
    }
  }

  String getErrorInfo(error, [String key = '']) {
    return getErrorInfoFromResponse(error);
  }
}
