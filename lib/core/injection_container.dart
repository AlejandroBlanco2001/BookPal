import 'package:bookpal/data/data_sources/remote/api_service.dart';
import 'package:bookpal/data/repositories/company_rep_implementation.dart';
import 'package:bookpal/data/repositories/loan_rep_implementation.dart';
import 'package:bookpal/data/repositories/physical_book_rep_implementation.dart';
import 'package:bookpal/data/repositories/user_rep_implementation.dart';
import 'package:bookpal/device/devices/barcode_scanner/barcode_scanner.dart';
import 'package:bookpal/device/devices/nfc_adapter/nfc_adapter.dart';
import 'package:bookpal/domain/repositories/company_repository.dart';
import 'package:bookpal/domain/repositories/loan_repository.dart';
import 'package:bookpal/domain/repositories/physical_book_repository.dart';
import 'package:bookpal/domain/repositories/user_repository.dart';
import 'package:bookpal/domain/usecases/company/get_companies_usecase.dart';
import 'package:bookpal/domain/usecases/company/get_company_usecase.dart';
import 'package:bookpal/domain/usecases/company/update_company_usecase.dart';
import 'package:bookpal/domain/usecases/loan/create_loan_usecase.dart';
import 'package:bookpal/domain/usecases/loan/get_loan_usecase.dart';
import 'package:bookpal/domain/usecases/loan/get_loans_by_user_usecase.dart';
import 'package:bookpal/domain/usecases/loan/make_loan_return_usecase.dart';
import 'package:bookpal/domain/usecases/physical_book/get_all_physical_books_usecase.dart';
import 'package:bookpal/domain/usecases/physical_book/get_physical_book_usecase.dart';
import 'package:bookpal/domain/usecases/user/get_user_usecase.dart';
import 'package:bookpal/domain/usecases/user/register_user_usecase.dart';
import 'package:bookpal/domain/usecases/user/update_user_usecase.dart';
import 'package:bookpal/presentation/company/remote_bloc/remote_company_bloc.dart';
import 'package:bookpal/presentation/loan/remote_bloc/remote_loan_bloc.dart';
import 'package:bookpal/presentation/physical_book/remote_bloc/remote_physical_book_bloc.dart';
import 'package:bookpal/presentation/user/remote_bloc/remote_user_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

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

  sl.registerFactory<RemoteCompanyBloc>(() => RemoteCompanyBloc(sl(), sl(), sl()));

  sl.registerSingleton<LoanRepository>(
    LoanRepositoryImplementation(sl())
  );

  sl.registerSingleton<CreateLoanUsecase>(
    CreateLoanUsecase(sl())
  );
  
  sl.registerSingleton<GetLoanUsecase>(
    GetLoanUsecase(sl())
  );
  
  sl.registerSingleton<GetLoansByUserUsecase>(
    GetLoansByUserUsecase(sl())
  );
  
  sl.registerSingleton<MakeLoanReturnUsecase>(
    MakeLoanReturnUsecase(sl())
  );
  
  sl.registerFactory<RemoteLoanBloc>(() => RemoteLoanBloc(sl(), sl(), sl(), sl()));

  sl.registerSingleton<PhysicalBookRepository>(
    PhysicalBookRepositoryImplementation(sl())
  );

  sl.registerSingleton<GetPhysicalBookUsecase>(
    GetPhysicalBookUsecase(sl())
  );

  sl.registerSingleton<GetAllPhysicalBooksUsecase>(
    GetAllPhysicalBooksUsecase(sl())
  );

  sl.registerFactory<RemotePhysicalBookBloc>(() => RemotePhysicalBookBloc(sl(), sl()));
  
  sl.registerSingleton<BarcodeScanner>(BarcodeScanner());

  sl.registerSingleton<NfcAdapter>(NfcAdapter());

  sl.registerSingleton(SharedPreferences.getInstance());

}