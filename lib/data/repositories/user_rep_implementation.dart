
import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/data/data_sources/remote/api_service.dart';
import 'package:bookpal/data/helpers/response_verifier.dart';
import 'package:bookpal/data/models/user_model.dart';
import 'package:bookpal/domain/entities/user.dart';
import 'package:bookpal/domain/repositories/user_repository.dart';
import 'package:bookpal/core/resources/data_state.dart';
import 'package:dio/dio.dart';

class UserRepositoryImplementation implements UserRepository {
  final ApiService _apiService;

  UserRepositoryImplementation(this._apiService);

  @override
  Future<DataState<UserModel>> getUserById(int id) async {
    try {

      logger.i('getUserById: $id');

      final httpResponse = await _apiService.getUserById(
        id: id,
      );

      final ResponseVerifier<UserModel> responseVerifier =
          ResponseVerifier<UserModel>();

      return responseVerifier.validateResponse(httpResponse);
      
    } on DioException catch (e) {
      logger.e(e);
      return DataFailed(500,e);
    }
  }

  @override
  Future<DataState<UserModel>> getUserByEmail(String email) async {
    try {
      final httpResponse = await _apiService.getUserByEmail(
        email: email,
      );

      final ResponseVerifier<UserModel> responseVerifier =
          ResponseVerifier<UserModel>();

      return responseVerifier.validateResponse(httpResponse);
      
    } on DioException catch (e) {
      return DataFailed(500,e);
    }
  }

  @override
  Future<DataState<UserModel>> putUserById(int id, User user) async {
    try {
      final httpResponse = await _apiService.putUserById(
        id: id,
        user: user as UserModel
      );

      final ResponseVerifier<UserModel> responseVerifier =
          ResponseVerifier<UserModel>();

      return responseVerifier.validateResponse(httpResponse);
      
    } on DioException catch (e) {
      return DataFailed(500,e);
    }
  }

  @override
  Future<DataState<UserModel>> putUserByEmail(String email, User user) async {
    try {
      final httpResponse = await _apiService.putUserByEmail(
        email: email,
        user: user as UserModel
      );

      final ResponseVerifier<UserModel> responseVerifier =
          ResponseVerifier<UserModel>();

      return responseVerifier.validateResponse(httpResponse);
      
    } on DioException catch (e) {
      return DataFailed(500,e);
    }
  }

  @override
  Future<DataState<UserModel>> postUser(User user) async {
    try {
      final httpResponse = await _apiService.postUser(
        user: user as UserModel
      );

      final ResponseVerifier<UserModel> responseVerifier =
          ResponseVerifier<UserModel>();

      return responseVerifier.validateResponse(httpResponse);
      
    } on DioException catch (e) {
      return DataFailed(500,e);
    }
  }
}
