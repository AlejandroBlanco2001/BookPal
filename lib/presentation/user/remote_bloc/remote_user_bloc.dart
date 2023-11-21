import 'package:bloc/bloc.dart';
import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/core/util/utilities.dart';
import 'package:bookpal/data/models/user_model.dart';
import 'package:bookpal/domain/usecases/user/get_user_usecase.dart';
import 'package:bookpal/domain/usecases/user/register_user_usecase.dart';
import 'package:bookpal/domain/usecases/user/update_user_usecase.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'remote_user_event.dart';
part 'remote_user_state.dart';

class RemoteUserBloc extends Bloc<RemoteUserEvent, RemoteUserState> {
  final GetUserUsecase _getUser;
  final UpdateUserUsecase _updateUser;
  final RegisterUserUsecase _registerUser;

  RemoteUserBloc(this._getUser, this._updateUser, this._registerUser)
      : super(RemoteUserInitial()) {
    on<GetUser>(onGetUser);
    on<UpdateUser>(onUpdateUser);
    on<RegisterUser>(onRegisterUser);
  }

  void onGetUser(GetUser event, Emitter<RemoteUserState> emit) async {
    emit(RemoteUserLoading());
    try {
      final dataState = await _getUser(params: {
        Utilities.getIdentifierName(event.identifier): event.identifier
      });
      if (dataState is DataSuccess && dataState.data != null) {
        emit(RemoteUserLoaded(
            dataState.statusCode, dataState.data! as UserModel));
      } else if (dataState is DataFailed) {
        logger
            .e('Data Failed ${dataState.error!.message} \n${dataState.error}');
        emit(RemoteUserError(
            dataState.error!, dataState.statusCode, dataState.message));
      }
    } on Error catch (e) {
      logger.e('$e. Stacktrace: ${e.stackTrace}');
      emit(RemoteUserError.genericError(e));
    } catch (e) {
      logger.e(e);
      emit(RemoteUserError.genericError(e));
    }
  }

  void onUpdateUser(UpdateUser event, Emitter<RemoteUserState> emit) async {
    emit(RemoteUserLoading());
    try {
      final dataState = await _updateUser(params: {
        Utilities.getIdentifierName(event.identifier): event.identifier,
        'fields': event.fields
      });
      if (dataState is DataSuccess && dataState.data != null) {
        emit(RemoteUserUpdated(
            dataState.statusCode, dataState.data! as UserModel));
      } else if (dataState is DataFailed) {
        logger.e(dataState.error);
        emit(RemoteUserError(
            dataState.error!, dataState.statusCode, dataState.message));
      }
    } on Error catch (e) {
      logger.e('$e. Stacktrace: ${e.stackTrace}');
      emit(RemoteUserError.genericError(e));
    } catch (e) {
      logger.e(e);
      emit(RemoteUserError.genericError(e));
    }
  }

  void onRegisterUser(RegisterUser event, Emitter<RemoteUserState> emit) async {
    emit(RegisteringUser());
    logger.i('Registering user: ${event.user.toJson()}');
    try {
      final dataState = await _registerUser(params: {'user': event.user});
      //logger.i('User registered: $dataState');
      if (dataState is DataSuccess && dataState.data != null) {
        emit(RemoteUserRegistered(
            dataState.statusCode, dataState.data! as UserModel));
      } else if (dataState is DataFailed) {
        logger.d(dataState.message, error: dataState.error, stackTrace: dataState.error!.stackTrace);
        emit(RegisterUserError(
            dataState.error!, dataState.statusCode, dataState.message));
      }
    } on DioException catch (e) {
      logger.e(e);
      emit(RegisterUserError(e, e.response?.statusCode));
    } on Error catch (e) {
      logger.e('$e. Stacktrace: ${e.stackTrace}');
      emit(RegisterUserError.genericError(e));
    } catch (e) {
      logger.e(e);
      emit(RegisterUserError.genericError(e));
    }
  }
}
