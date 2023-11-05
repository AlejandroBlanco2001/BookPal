
import 'package:bookpal/core/resources/data_state.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

class ResponseVerifier<T> {
  DataState<T> validateResponse(HttpResponse<T> httpResponse) {
    if (httpResponse.response.statusCode! >= 200 &&
        httpResponse.response.statusCode! < 300) {
      return DataSuccess(httpResponse.response.statusCode!, httpResponse.data);
    } else {
      return DataFailed(
          httpResponse.response.statusCode!,
          DioException(
            requestOptions: httpResponse.response.requestOptions,
            type: DioExceptionType.badResponse,
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
          ),
          (httpResponse.response.data['message'] is List)
              ? httpResponse.response.data['message']
              : [httpResponse.response.data['message'] ?? "No message"]);
    }
  }
}
