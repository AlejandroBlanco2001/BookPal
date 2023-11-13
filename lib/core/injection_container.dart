import 'package:bookpal/data/data_sources/remote/api_service.dart';
import 'package:bookpal/data/repositories/authentication_rep_implementation.dart';
import 'package:bookpal/data/repositories/company_rep_implementation.dart';
import 'package:bookpal/data/repositories/loan_rep_implementation.dart';
import 'package:bookpal/data/repositories/physical_book_rep_implementation.dart';
import 'package:bookpal/data/repositories/user_rep_implementation.dart';
import 'package:bookpal/device/devices/barcode_scanner/barcode_scanner.dart';
import 'package:bookpal/device/devices/nfc_adapter/nfc_adapter.dart';
import 'package:bookpal/domain/repositories/authentication_repository.dart';
import 'package:bookpal/domain/repositories/company_repository.dart';
import 'package:bookpal/domain/repositories/loan_repository.dart';
import 'package:bookpal/domain/repositories/physical_book_repository.dart';
import 'package:bookpal/domain/repositories/user_repository.dart';
import 'package:bookpal/domain/usecases/authentication/login_usecase.dart';
import 'package:bookpal/domain/usecases/company/get_companies_usecase.dart';
import 'package:bookpal/domain/usecases/company/get_company_usecase.dart';
import 'package:bookpal/domain/usecases/company/update_company_usecase.dart';
import 'package:bookpal/domain/usecases/loan/create_loan_usecase.dart';
import 'package:bookpal/domain/usecases/loan/get_loan_usecase.dart';
import 'package:bookpal/domain/usecases/loan/get_loans_by_user_usecase.dart';
import 'package:bookpal/domain/usecases/loan/make_loan_return_usecase.dart';
import 'package:bookpal/domain/usecases/physical_book/get_all_physical_books_usecase.dart';
import 'package:bookpal/domain/usecases/physical_book/get_physical_book_usecase.dart';
import 'package:bookpal/domain/usecases/scanning/read_nfc_usecase.dart';
import 'package:bookpal/domain/usecases/scanning/scan_barcode_usecase.dart';
import 'package:bookpal/domain/usecases/user/get_user_usecase.dart';
import 'package:bookpal/domain/usecases/user/register_user_usecase.dart';
import 'package:bookpal/domain/usecases/user/update_user_usecase.dart';
import 'package:bookpal/presentation/authentication/bloc/login_bloc.dart';
import 'package:bookpal/presentation/navigation/bloc/navigation_bloc.dart';
import 'package:bookpal/presentation/barcode/bloc/barcode_bloc.dart';
import 'package:bookpal/presentation/company/remote_bloc/remote_company_bloc.dart';
import 'package:bookpal/presentation/loan/remote_bloc/remote_loan_bloc.dart';
import 'package:bookpal/presentation/nfc/bloc/nfc_bloc.dart';
import 'package:bookpal/presentation/physical_book/remote_bloc/remote_physical_book_bloc.dart';
import 'package:bookpal/presentation/storage_bucket/bloc/bucket_bloc.dart';
import 'package:bookpal/presentation/user/remote_bloc/remote_user_bloc.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  getIt.registerSingleton<Logger>(Logger());

  getIt.registerSingleton<FirebaseStorage>(FirebaseStorage.instance);

  getIt.registerFactory<Reference>(() => getIt<FirebaseStorage>().ref());

  getIt.registerSingleton<Dio>(Dio());

  getIt.registerSingleton<ApiService>(ApiService(getIt()));

  getIt
      .registerSingleton<UserRepository>(UserRepositoryImplementation(getIt()));

  getIt.registerSingleton<GetUserUsecase>(GetUserUsecase(getIt()));

  getIt.registerSingleton<UpdateUserUsecase>(UpdateUserUsecase(getIt()));

  getIt.registerSingleton<RegisterUserUsecase>(RegisterUserUsecase(getIt()));

  getIt.registerFactory<RemoteUserBloc>(
      () => RemoteUserBloc(getIt(), getIt(), getIt()));

  getIt.registerSingleton<CompanyRepository>(
      CompanyRepositoryImplementation(getIt()));

  getIt.registerSingleton<GetCompanyUsecase>(GetCompanyUsecase(getIt()));

  getIt.registerSingleton<GetCompaniesUsecase>(GetCompaniesUsecase(getIt()));

  getIt.registerSingleton<UpdateCompanyUsecase>(UpdateCompanyUsecase(getIt()));

  getIt.registerFactory<RemoteCompanyBloc>(
      () => RemoteCompanyBloc(getIt(), getIt(), getIt()));

  getIt
      .registerSingleton<LoanRepository>(LoanRepositoryImplementation(getIt()));

  getIt.registerSingleton<CreateLoanUsecase>(CreateLoanUsecase(getIt()));

  getIt.registerSingleton<GetLoanUsecase>(GetLoanUsecase(getIt()));

  getIt
      .registerSingleton<GetLoansByUserUsecase>(GetLoansByUserUsecase(getIt()));

  getIt
      .registerSingleton<MakeLoanReturnUsecase>(MakeLoanReturnUsecase(getIt()));

  getIt.registerFactory<RemoteLoanBloc>(
      () => RemoteLoanBloc(getIt(), getIt(), getIt(), getIt()));

  getIt.registerSingleton<PhysicalBookRepository>(
      PhysicalBookRepositoryImplementation(getIt()));

  getIt.registerSingleton<GetPhysicalBookUsecase>(
      GetPhysicalBookUsecase(getIt()));

  getIt.registerSingleton<GetAllPhysicalBooksUsecase>(
      GetAllPhysicalBooksUsecase(getIt()));

  getIt.registerFactory<RemotePhysicalBookBloc>(
      () => RemotePhysicalBookBloc(getIt(), getIt()));

  getIt.registerSingleton<BarcodeScanner>(BarcodeScanner());

  getIt.registerSingleton<ScanBarcodeUsecase>(ScanBarcodeUsecase());

  getIt.registerFactory<BarcodeBloc>(() => BarcodeBloc(getIt()));

  getIt.registerSingleton<NfcAdapter>(NfcAdapter());

  getIt.registerSingleton<ReadNfcUsecase>(ReadNfcUsecase());

  getIt.registerFactory<NfcBloc>(() => NfcBloc(getIt()));

  getIt.registerSingleton<AuthenticationRepository>(
      AuthenticationRepositoryImplementation(getIt()));

  getIt.registerSingleton<LoginUsecase>(LoginUsecase(getIt()));

  getIt.registerFactory<LoginBloc>(() => LoginBloc(getIt()));

  getIt.registerFactory<BucketBloc>(() => BucketBloc());

  getIt.registerFactory<NavigationBloc>(() => NavigationBloc());

  getIt.registerSingleton<SessionManager>(SessionManager());

  getIt.registerSingleton<AndroidOptions>(
      const AndroidOptions(encryptedSharedPreferences: true));

  getIt.registerSingleton<FlutterSecureStorage>(
      FlutterSecureStorage(aOptions: getIt()));
}
