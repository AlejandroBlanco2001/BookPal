
import 'package:bookpal/data/data_sources/remote/general_database_api_service.dart';
import 'package:bookpal/data/helpers/response_verifier.dart';
import 'package:bookpal/data/models/user_model.dart';
import 'package:bookpal/domain/entities/user.dart';
import 'package:bookpal/domain/repositories/user_repository.dart';
import 'package:bookpal/core/resources/data_state.dart';
import 'package:dio/dio.dart';

class UserRepositoryImplementation implements UserRepository {
  final GeneralDatabaseApiService _generalDatabaseApiService;

  UserRepositoryImplementation(this._generalDatabaseApiService);

  @override
  Future<DataState<UserModel>> getUserById(String id) async {
    try {
      final httpResponse = await _generalDatabaseApiService.getUserById(
        id: id,
      );

      final ResponseVerifier<UserModel> responseVerifier =
          ResponseVerifier<UserModel>();

      return responseVerifier.validateResponse(httpResponse);
      
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<UserModel>> getUserByEmail(String email) async {
    try {
      final httpResponse = await _generalDatabaseApiService.getUserByEmail(
        email: email,
      );

      final ResponseVerifier<UserModel> responseVerifier =
          ResponseVerifier<UserModel>();

      return responseVerifier.validateResponse(httpResponse);
      
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<UserModel>> putUserById(String id, User user) async {
    try {
      final httpResponse = await _generalDatabaseApiService.putUserById(
        id: id,
        user: user as UserModel
      );

      final ResponseVerifier<UserModel> responseVerifier =
          ResponseVerifier<UserModel>();

      return responseVerifier.validateResponse(httpResponse);
      
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<UserModel>> putUserByEmail(String email, User user) async {
    try {
      final httpResponse = await _generalDatabaseApiService.putUserByEmail(
        email: email,
        user: user as UserModel
      );

      final ResponseVerifier<UserModel> responseVerifier =
          ResponseVerifier<UserModel>();

      return responseVerifier.validateResponse(httpResponse);
      
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<UserModel>> postUser(User user) async {
    try {
      final httpResponse = await _generalDatabaseApiService.postUser(
        user: user as UserModel
      );

      final ResponseVerifier<UserModel> responseVerifier =
          ResponseVerifier<UserModel>();

      return responseVerifier.validateResponse(httpResponse);
      
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
