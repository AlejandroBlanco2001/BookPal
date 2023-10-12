import 'dart:io';

import 'package:bookpal/domain/resources/data_state.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

class ResponseVerifier<T> {
  DataState<T> validateResponse(
      HttpResponse<T> httpResponse) {
    if (httpResponse.response.statusCode == HttpStatus.ok) {
      return DataSucess(httpResponse.response.data);
    } else {
      return DataFailed(DioException(
        requestOptions: httpResponse.response.requestOptions,
        type: DioExceptionType.badResponse,
        error:
            '${httpResponse.response.statusCode}: ${httpResponse.response.statusMessage}',
        response: httpResponse.response,
      ));
    }
  }
}
