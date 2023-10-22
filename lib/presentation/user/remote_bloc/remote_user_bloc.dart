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
  // ignore: unused_field
  final UpdateUserUsecase _updateUser;
  // ignore: unused_field
  final RegisterUserUsecase _registerUser;

  RemoteUserBloc(this._getUser, this._updateUser, this._registerUser)
      : super(RemoteUserLoading()) {
    on<InitUser>((event, emit) async {
      emit(RemoteUserInitial());
    });
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
        logger.e('Data Failed ${dataState.error!.message} \n${dataState.error}');
        emit(RemoteUserError(dataState.error!, dataState.statusCode));
      }
    } on Error catch (e) {
      logger.e('$e. Stacktrace: ${e.stackTrace}');
      emit(RemoteUserError.genericError(e));
    } on Exception catch(e) {
      logger.e(e);
      emit(RemoteUserError.genericError(e));
    }
  }

  void onUpdateUser(UpdateUser event, Emitter<RemoteUserState> emit) async {
    emit(RemoteUserLoading());
    try {
      final dataState = await _updateUser(params: {
        Utilities.getIdentifierName(event.identifier): event.identifier,
        'user': event.user
      });
      if (dataState is DataSuccess && dataState.data != null) {
        emit(RemoteUserUpdated(
            dataState.statusCode, dataState.data! as UserModel));
      } else if (dataState is DataFailed) {
        logger.e(dataState.error);
        emit(RemoteUserError(dataState.error!, dataState.statusCode));
      }
    } catch (e) {
      logger.e(e);
      emit(RemoteUserError.genericError(e));
    }
  }

  void onRegisterUser(RegisterUser event, Emitter<RemoteUserState> emit) async {
    emit(RemoteUserLoading());
    try {
      final dataState = await _registerUser(params: {'user': event.user});
      if (dataState is DataSuccess && dataState.data != null) {
        emit(RemoteUserRegistered(
            dataState.statusCode, dataState.data! as UserModel));
      } else if (dataState is DataFailed) {
        logger.e(dataState.error);
        emit(RemoteUserError(dataState.error!, dataState.statusCode));
      }
    } catch (e) {
      logger.e(e);
      emit(RemoteUserError.genericError(e));
    }
  }
}
