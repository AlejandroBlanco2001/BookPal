import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/core/util/utilities.dart';
import 'package:bookpal/data/data_sources/remote/api_service.dart';
import 'package:bookpal/data/models/rating_model.dart';
import 'package:bookpal/data/util/response_verifier.dart';
import 'package:bookpal/domain/entities/rating.dart';
import 'package:bookpal/domain/repositories/rating_repository.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class RatingRepositoryImplementation implements RatingRepository {
  final ApiService _apiService;

  RatingRepositoryImplementation(this._apiService);

  @override
  Future<DataState<List<RatingModel>>> getUserRatings() async {
    try {
      String authorization = await Utilities.getAuthorization();
      int userId = JwtDecoder.decode(authorization)['id'];
      final httpResponse = await _apiService.getUserRatings(
        userId: userId,
        authorization: authorization,
      );
      final ResponseVerifier<List<RatingModel>> responseVerifier =
          ResponseVerifier<List<RatingModel>>();
      return responseVerifier.validateResponse(httpResponse);
    } on DioException catch (e) {
      List<String>? messages = (e.response?.data['message'] is List)
          ? List<String>.from(
              e.response?.data['message'].map((m) => m.toString()))
          : [e.response?.data['message']];
      return DataFailed(e.response?.statusCode ?? 500, e, messages);
    }
  }

  @override
  Future<DataState<Rating>> postRating(Map<String, dynamic> fields) async {
    try {
      String authorization = await Utilities.getAuthorization();
      final httpResponse = await _apiService.postRating(
        fields: fields,
        authorization: authorization,
      );

      final ResponseVerifier<RatingModel> responseVerifier =
          ResponseVerifier<RatingModel>();

      return responseVerifier.validateResponse(httpResponse);
    } on DioException catch (e) {
      List<String>? messages = (e.response?.data['message'] is List)
          ? List<String>.from(
              e.response?.data['message'].map((m) => m.toString()))
          : [e.response?.data['message']];
      return DataFailed(e.response?.statusCode ?? 500, e, messages);
    }
  }

  @override
  Future<DataState<RatingModel>> putRating(int id, Map<String,dynamic> fields) async {
    try {
      String authorization = await Utilities.getAuthorization();
      final httpResponse = await _apiService.putRating(
        id: id,
        fields: fields,
        authorization: authorization,
      );

      final ResponseVerifier<RatingModel> responseVerifier =
          ResponseVerifier<RatingModel>();

      return responseVerifier.validateResponse(httpResponse);
    } on DioException catch (e) {
      List<String>? messages = (e.response?.data['message'] is List)
          ? List<String>.from(
              e.response?.data['message'].map((m) => m.toString()))
          : [e.response?.data['message']];
      return DataFailed(e.response?.statusCode ?? 500, e, messages);
    }
  }
}