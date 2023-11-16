import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/data/models/company_model.dart';
import 'package:bookpal/data/models/loan_model.dart';
import 'package:bookpal/data/models/physical_book_model.dart';
import 'package:bookpal/data/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/user/id/{id}')
  Future<HttpResponse<UserModel>> getUserById({
    @Header('Content-Type') String contentType = contentType,
    @Header('Authorization') String? authorization,
    @Path() required int id
  });

  @GET('/user/email/{email}')
  Future<HttpResponse<UserModel>> getUserByEmail({
    @Header('Content-Type') String contentType = contentType,
    @Header('Authorization') String? authorization,
    @Path() required String email
  });

  @PUT('/user/id/{id}')
  Future<HttpResponse<UserModel>> putUserById({
    @Header('Content-Type') String contentType = contentType,
    @Header('Authorization') String? authorization,
    @Path() required int id,
    @Body() required Map<String,dynamic> fields
  });

  @PUT('/user/email/{email}')
  Future<HttpResponse<UserModel>> putUserByEmail({
    @Header('Content-Type') String contentType = contentType,
    @Header('Authorization') String? authorization,
    @Path() required String email,
    @Body() required Map<String,dynamic> fields
  });

  @POST('/user')
  Future<HttpResponse<UserModel>> postUser({
    @Header('Content-Type') String contentType = contentType,
    @Header('Authorization') String? authorization,
    @Body() required UserModel user
  });

  @POST('/auth/login')
  Future<HttpResponse> login({
    @Header('Content-Type') String contentType = contentType,
    @Header('Authorization') String? authorization,
    @Body() required Map<String, String> credentials
  });

  // @GET('/book/{barcode}')
  // Future<HttpResponse<BookModel>> getBook({
  //   @Header('Content-Type') String contentType = contentType,
  //   @Header('x-api-key') String apiKey = apiKey,
  //   @Header('Authorization') String? authorization,
  //   @Path() required String barcode
  // });

  // @GET('/book')
  // Future<HttpResponse<List<BookModel>>> getBooks({
  //   @Header('Content-Type') String contentType = contentType,
  //   @Header('x-api-key') String apiKey = apiKey,
  //   @Header('Authorization') String? authorization,
  // });

  @GET('/company/style/{id}')
  Future<HttpResponse<CompanyModel>> getCompanyStyle({
    @Header('Content-Type') String contentType = contentType,
    @Header('Authorization') String? authorization,
    @Path() required int id
  });

  @GET('/company/{id}')
  Future<HttpResponse<CompanyModel>> getCompany({
    @Header('Content-Type') String contentType = contentType,
    @Header('Authorization') String? authorization,
    @Path() required int id
  });

  @GET('/company')
  Future<HttpResponse<List<CompanyModel>>> getCompanies({
    @Header('Content-Type') String contentType = contentType,
    @Header('Authorization') String? authorization,
  });

  @PUT('/company/{id}')
  Future<HttpResponse<CompanyModel>> putCompany({
    @Header('Content-Type') String contentType = contentType,
    @Header('Authorization') String? authorization,
    @Path() required int id,
    @Body() required Map<String, dynamic> fields
  });

  // @GET('/fines/{id}')
  // Future<HttpResponse<FineModel>> getFine({
  //   @Header('Content-Type') String contentType = contentType,
  //   @Header('x-api-key') String apiKey = apiKey,
  //   @Header('Authorization') String? authorization,
  //   @Path() required int id
  // });

  // @GET('/fines-by-user/{userId}')
  // Future<HttpResponse<List<FineModel>>> getFinesByUser({
  //   @Header('Content-Type') String contentType = contentType,
  //   @Header('x-api-key') String apiKey = apiKey,
  //   @Header('Authorization') String? authorization,
  //   @Path() required int userId
  // });

  // @GET('/inventory/{id}')
  // Future<HttpResponse<InventoryModel>> getInventory({
  //   @Header('Content-Type') String contentType = contentType,
  //   @Header('x-api-key') String apiKey = apiKey,
  //   @Header('Authorization') String? authorization,
  //   @Path() required int id
  // });

  // @GET('/item-inventory/{itemId}')
  // Future<HttpResponse<InventoryModel>> getInventoryForItem({
  //   @Header('Content-Type') String contentType = contentType,
  //   @Header('Authorization') String? authorization,
  //   @Path() required String itemId
  // });

  @GET('/loan/{id}')
  Future<HttpResponse<LoanModel>> getLoan({
    @Header('Content-Type') String contentType = contentType,
    @Header('Authorization') String? authorization,
    @Path() required int id
  });

  @GET('/loan/user/{userId}')
  Future<HttpResponse<List<LoanModel>>> getLoansByUser({
    @Header('Content-Type') String contentType = contentType,
    @Header('Authorization') String? authorization,
    @Path() required int userId
  });

  @PUT('/loan/return/{id}')
  Future<HttpResponse<LoanModel>> makeReturn({
    @Header('Content-Type') String contentType = contentType,
    @Header('Authorization') String? authorization,
    @Path() required int id
  });

  @POST('/loan')
  Future<HttpResponse<LoanModel>> postLoan({
    @Header('Content-Type') String contentType = contentType,
    @Header('Authorization') String? authorization,
    @Body() required Map<String, dynamic> fields
  });

  // @GET('/notifications/{id}')
  // Future<HttpResponse<NotificationModel>> getNotification({
  //   @Header('Content-Type') String contentType = contentType,
  //   @Header('x-api-key') String apiKey = apiKey,
  //   @Header('Authorization') String? authorization,
  //   @Path() required int id
  // });

  // @GET('/notifications-by-user/{userId}')
  // Future<HttpResponse<List<NotificationModel>>> getUserNotifications({
  //   @Header('Content-Type') String contentType = contentType,
  //   @Header('x-api-key') String apiKey = apiKey,
  //   @Header('Authorization') String? authorization,
  //   @Path() required int userId
  // });

  @GET('/physical-book/id/{id}')
  Future<HttpResponse<PhysicalBookModel>> getPhysicalBookById({
    @Header('Content-Type') String contentType = contentType,
    @Header('Authorization') String? authorization,
    @Path() required int id
  });

  @GET('/physical-book/barcode/{barcode}')
  Future<HttpResponse<PhysicalBookModel>> getPhysicalBookByBarcode({
    @Header('Content-Type') String contentType = contentType,
    @Header('Authorization') String? authorization,
    @Path() required String barcode
  });

  @GET('/physical-book')
  Future<HttpResponse<List<PhysicalBookModel>>> getPhysicalBooks({
    @Header('Content-Type') String contentType = contentType,
    @Header('Authorization') String? authorization,
    @Query('take') int? take = 10
  });

  // @GET('/references/{id}')
  // Future<HttpResponse<ReferenceModel>> getReference({
  //   @Header('Content-Type') String contentType = contentType,
  //   @Header('x-api-key') String apiKey = apiKey,
  //   @Header('Authorization') String? authorization,
  //   @Path() required int id
  // });

  // @GET('/sub-book-relations/{id}')
  // Future<HttpResponse<SubjectBookRelationModel>> getRelation({
  //   @Header('Content-Type') String contentType = contentType,
  //   @Header('x-api-key') String apiKey = apiKey,
  //   @Header('Authorization') String? authorization,
  //   @Path() required int id
  // });

  // @GET('/sub-book-relations/related-subjects/{bookId}')
  // Future<HttpResponse<List<String>>> getRelatedSubjects({
  //   @Header('Content-Type') String contentType = contentType,
  //   @Header('x-api-key') String apiKey = apiKey,
  //   @Header('Authorization') String? authorization,
  //   @Path() required int bookId
  // });

  // @GET('/sub-book-relations/related-books/{subjectId}')
  // Future<HttpResponse<List<String>>> getRelatedBooks({
  //   @Header('Content-Type') String contentType = contentType,
  //   @Header('x-api-key') String apiKey = apiKey,
  //   @Header('Authorization') String? authorization,
  //   @Path() required int subjectId
  // });

  // @GET('/subjects/{id}')
  // Future<HttpResponse<SubjectModel>> getSubject({
  //   @Header('Content-Type') String contentType = contentType,
  //   @Header('x-api-key') String apiKey = apiKey,
  //   @Header('Authorization') String? authorization,
  //   @Path() required int id
  // });
}