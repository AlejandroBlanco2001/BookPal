import 'dart:io';

import 'package:bookpal/core/resources/data_state.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

class ResponseVerifier<T> {
  DataState<T> validateResponse(HttpResponse<T> httpResponse) {
    if (httpResponse.response.statusCode == HttpStatus.ok) {
      return DataSuccess(httpResponse.response.statusCode!, httpResponse.data);
    } else {
      return DataFailed(
          httpResponse.response.statusCode!,
          DioException(
            requestOptions: httpResponse.response.requestOptions,
            type: DioExceptionType.badResponse,
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
          ));
    }
  }
}
