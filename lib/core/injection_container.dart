import 'package:bookpal/data/data_sources/remote/api_service.dart';
import 'package:bookpal/data/repositories/user_rep_implementation.dart';
import 'package:bookpal/domain/repositories/user_repository.dart';
import 'package:bookpal/domain/usecases/user/get_user_usecase.dart';
import 'package:bookpal/presentation/user/remote_bloc/remote_user_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> InitializeDependencies() async {

  sl.registerSingleton<Dio>(Dio());

  sl.registerSingleton<ApiService>(ApiService(sl()));

  sl.registerSingleton<UserRepository>(
    UserRepositoryImplementation(sl())
  );

  sl.registerSingleton<GetUserUsecase>(
    GetUserUsecase(sl())
  );

  sl.registerFactory<RemoteUserBloc>(() => RemoteUserBloc(sl(), sl(), sl()));
}