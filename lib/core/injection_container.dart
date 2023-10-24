import 'package:bookpal/data/data_sources/remote/api_service.dart';
import 'package:bookpal/data/repositories/company_rep_implementation.dart';
import 'package:bookpal/data/repositories/user_rep_implementation.dart';
import 'package:bookpal/domain/repositories/company_repository.dart';
import 'package:bookpal/domain/repositories/user_repository.dart';
import 'package:bookpal/domain/usecases/company/get_companies_usecase.dart';
import 'package:bookpal/domain/usecases/company/get_company_usecase.dart';
import 'package:bookpal/domain/usecases/company/update_company_usecase.dart';
import 'package:bookpal/domain/usecases/user/get_user_usecase.dart';
import 'package:bookpal/domain/usecases/user/register_user_usecase.dart';
import 'package:bookpal/domain/usecases/user/update_user_usecase.dart';
import 'package:bookpal/presentation/user/remote_bloc/remote_user_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  sl.registerSingleton<UpdateUserUsecase>(
    UpdateUserUsecase(sl())
  );

  sl.registerSingleton<RegisterUserUsecase>(
    RegisterUserUsecase(sl())
  );

  sl.registerFactory<RemoteUserBloc>(() => RemoteUserBloc(sl(), sl(), sl()));

  sl.registerSingleton<CompanyRepository>(
    CompanyRepositoryImplementation(sl())
  );

  sl.registerSingleton<GetCompanyUsecase>(
    GetCompanyUsecase(sl())
  );

  sl.registerSingleton<GetCompaniesUsecase>(
    GetCompaniesUsecase(sl())
  );

  sl.registerSingleton<UpdateCompanyUsecase>(
    UpdateCompanyUsecase(sl())
  );

  sl.registerSingleton(SharedPreferences.getInstance());

}