import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/core/util/utilities.dart';
import 'package:bookpal/data/data_sources/remote/api_service.dart';
import 'package:bookpal/data/models/favorite_model.dart';
import 'package:bookpal/data/util/response_verifier.dart';
import 'package:bookpal/domain/repositories/favorite_repository.dart';
import 'package:dio/dio.dart';

class FavoriteRepositoryImplementation extends FavoriteRepository {
  
  final ApiService _apiService;

  FavoriteRepositoryImplementation(this._apiService);

  @override
  Future<DataState<List<FavoriteModel>>> getFavorites() async {
    try {
      String authorization = await Utilities.getAuthorization();
      final httpResponse = await _apiService.getFavorites(
        authorization: authorization,
      );
      final ResponseVerifier<List<FavoriteModel>> responseVerifier =
          ResponseVerifier<List<FavoriteModel>>();
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
  Future<DataState<FavoriteModel>> postFavorite(String bookBarcode) async {
    try {
      String authorization = await Utilities.getAuthorization();
      final httpResponse = await _apiService.postFavorite(
        authorization: authorization,
        fields: {
          "physical_book_barcode": bookBarcode,
        },
      );
      final ResponseVerifier<FavoriteModel> responseVerifier =
          ResponseVerifier<FavoriteModel>();
      return responseVerifier.validateResponse(httpResponse);
    } on DioException catch (e) {
      List<String>? messages = (e.response?.data['message'] is List)
          ? List<String>.from(
              e.response?.data['message'].map((m) => m.toString()))
          : [e.response?.data['message']];
      return DataFailed(e.response?.statusCode ?? 500, e, messages);
    } catch (e) {
      rethrow;
    }
  }
}