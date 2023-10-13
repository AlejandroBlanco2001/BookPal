import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/core/constants/credentials.dart';
import 'package:bookpal/data/models/book_model.dart';
import 'package:bookpal/data/models/company_model.dart';
import 'package:bookpal/data/models/fine_model.dart';
import 'package:bookpal/data/models/inventory_model.dart';
import 'package:bookpal/data/models/loan_model.dart';
import 'package:bookpal/data/models/notification_model.dart';
import 'package:bookpal/data/models/physical_book_model.dart';
import 'package:bookpal/data/models/reference_model.dart';
import 'package:bookpal/data/models/subject_book_relation_model.dart';
import 'package:bookpal/data/models/subject_model.dart';
import 'package:bookpal/data/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'general_database_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class GeneralDatabaseApiService {
  factory GeneralDatabaseApiService(Dio dio, {String baseUrl}) = _GeneralDatabaseApiService;

  @GET('/user/id/{id}')
  Future<HttpResponse<UserModel>> getUserById({
    @Header('Content-Type') String contentType = contentType,
    @Header('x-api-key') String apiKey = apiKey,
    @Path() required String id
  });

  @GET('/user/email/{email}')
  Future<HttpResponse<UserModel>> getUserByEmail({
    @Header('Content-Type') String contentType = contentType,
    @Header('x-api-key') String apiKey = apiKey,
    @Path() required String email
  });

  @PUT('/user/id/{id}')
  Future<HttpResponse<UserModel>> putUserById({
    @Header('Content-Type') String contentType = contentType,
    @Header('x-api-key') String apiKey = apiKey,
    @Path() required String id,
    @Body() required UserModel user
  });

  @PUT('/user/email/{email}')
  Future<HttpResponse<UserModel>> putUserByEmail({
    @Header('Content-Type') String contentType = contentType,
    @Header('x-api-key') String apiKey = apiKey,
    @Path() required String email,
    @Body() required UserModel user
  });

  @POST('/user')
  Future<HttpResponse<UserModel>> postUser({
    @Header('Content-Type') String contentType = contentType,
    @Header('x-api-key') String apiKey = apiKey,
    @Body() required UserModel user
  });

  @GET('/book/{barcode}')
  Future<HttpResponse<BookModel>> getBook({
    @Header('Content-Type') String contentType = contentType,
    @Header('x-api-key') String apiKey = apiKey,
    @Path() required String barcode
  });

  @GET('/book')
  Future<HttpResponse<List<BookModel>>> getBooks({
    @Header('Content-Type') String contentType = contentType,
    @Header('x-api-key') String apiKey = apiKey,
  });

  @GET('/companies/{id}')
  Future<HttpResponse<CompanyModel>> getCompany({
    @Header('Content-Type') String contentType = contentType,
    @Header('x-api-key') String apiKey = apiKey,
    @Path() required String id
  });

  @GET('/fines/{id}')
  Future<HttpResponse<FineModel>> getFine({
    @Header('Content-Type') String contentType = contentType,
    @Header('x-api-key') String apiKey = apiKey,
    @Path() required String id
  });

  @GET('/fines-by-user/{userId}')
  Future<HttpResponse<List<FineModel>>> getFinesByUser({
    @Header('Content-Type') String contentType = contentType,
    @Header('x-api-key') String apiKey = apiKey,
    @Path() required String userId
  });

  @GET('/inventory/{id}')
  Future<HttpResponse<InventoryModel>> getInventory({
    @Header('Content-Type') String contentType = contentType,
    @Header('x-api-key') String apiKey = apiKey,
    @Path() required String id
  });

  @GET('/item-inventory/{itemId}')
  Future<HttpResponse<InventoryModel>> getInventoryForItem({
    @Header('Content-Type') String contentType = contentType,
    @Header('x-api-key') String apiKey = apiKey,
    @Path() required String itemId
  });

  @GET('/loans/{id}')
  Future<HttpResponse<LoanModel>> getLoan({
    @Header('Content-Type') String contentType = contentType,
    @Header('x-api-key') String apiKey = apiKey,
    @Path() required String id
  });

  @GET('/loans-by-user/{userId}')
  Future<HttpResponse<List<LoanModel>>> getLoansByUser({
    @Header('Content-Type') String contentType = contentType,
    @Header('x-api-key') String apiKey = apiKey,
    @Path() required String userId
  });

  @GET('/notifications/{id}')
  Future<HttpResponse<NotificationModel>> getNotification({
    @Header('Content-Type') String contentType = contentType,
    @Header('x-api-key') String apiKey = apiKey,
    @Path() required String id
  });

  @GET('/notifications-by-user/{userId}')
  Future<HttpResponse<List<NotificationModel>>> getUserNotifications({
    @Header('Content-Type') String contentType = contentType,
    @Header('x-api-key') String apiKey = apiKey,
    @Path() required String userId
  });

  @GET('/physical-books/{id}')
  Future<HttpResponse<PhysicalBookModel>> getPhysicalBook({
    @Header('Content-Type') String contentType = contentType,
    @Header('x-api-key') String apiKey = apiKey,
    @Path() required String id
  });

  @GET('/references/{id}')
  Future<HttpResponse<ReferenceModel>> getReference({
    @Header('Content-Type') String contentType = contentType,
    @Header('x-api-key') String apiKey = apiKey,
    @Path() required String id
  });

  @GET('/sub-book-relations/{id}')
  Future<HttpResponse<SubjectBookRelationModel>> getRelation({
    @Header('Content-Type') String contentType = contentType,
    @Header('x-api-key') String apiKey = apiKey,
    @Path() required String id
  });

  @GET('/sub-book-relations/related-subjects/{bookId}')
  Future<HttpResponse<List<String>>> getRelatedSubjects({
    @Header('Content-Type') String contentType = contentType,
    @Header('x-api-key') String apiKey = apiKey,
    @Path() required String bookId
  });

  @GET('/sub-book-relations/related-books/{subjectId}')
  Future<HttpResponse<List<String>>> getRelatedBooks({
    @Header('Content-Type') String contentType = contentType,
    @Header('x-api-key') String apiKey = apiKey,
    @Path() required String subjectId
  });

  @GET('/subjects/{id}')
  Future<HttpResponse<SubjectModel>> getSubject({
    @Header('Content-Type') String contentType = contentType,
    @Header('x-api-key') String apiKey = apiKey,
    @Path() required String id
  });
}