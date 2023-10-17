import 'package:bloc/bloc.dart';
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

  RemoteUserBloc( this._getUser, this._updateUser, this._registerUser) : super(RemoteUserLoading()) {
    on<GetUser>(onGetUser);
  }

  void onGetUser(GetUser event, Emitter<RemoteUserState> emit) async {
    final dataState = await _getUser(params: {Utilities.getIdentifierName(event.identifier): event.identifier});
    if (dataState is DataSuccess && dataState.data != null) {
      emit(RemoteUserLoaded(dataState.statusCode, dataState.data! as UserModel));
    } else if (dataState is DataFailed) {
      emit(RemoteUserError(dataState.statusCode, dataState.error!));
    }
  }
}