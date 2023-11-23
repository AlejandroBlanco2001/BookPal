part of 'user_ratings_bloc.dart';

sealed class UserRatingsState extends Equatable {
  final List<RatingModel>? userRatings;
  final int? statusCode;
  final List<String>? message;
  final dynamic error;
  final DioException? dioException;

  const UserRatingsState({
    this.userRatings,
    this.statusCode,
    this.message,
    this.error,
    this.dioException,
  });

  @override
  List<Object?> get props =>
      [userRatings, statusCode, message, error, dioException];
}

final class UserRatingsInitial extends UserRatingsState {}

final class FetchingUserRatings extends UserRatingsState {}

final class UserRatingsFetched extends UserRatingsState {
  const UserRatingsFetched(int statusCode, List<RatingModel> userRatings)
      : super(statusCode: statusCode, userRatings: userRatings);

  @override
  List<Object?> get props => [statusCode, userRatings];
}

final class UserRatingsUpdated extends UserRatingsState {

  const UserRatingsUpdated(List<RatingModel> userRatings, [int? statusCode])
      : super(userRatings: userRatings, statusCode: statusCode);

  @override
  List<Object?> get props => [userRatings, statusCode];
}

final class UserRatingsUpdatedTemp extends UserRatingsState {

  const UserRatingsUpdatedTemp(List<RatingModel> userRatings, [int? statusCode])
      : super(userRatings: userRatings, statusCode: statusCode);

  @override
  List<Object?> get props => [userRatings, statusCode];
}


final class UserRatingsError extends UserRatingsState {
  const UserRatingsError(DioException dioException,
      [int? statusCode, List<String>? message])
      : super(
            statusCode: statusCode,
            dioException: dioException,
            message: message);
  const UserRatingsError.fromGenericError(dynamic error)
      : super(error: error);

  @override
  List<Object?> get props => [statusCode, dioException, message, error];
}

final class RateBookError extends UserRatingsState {
  const RateBookError(DioException dioException, List<RatingModel> rollbackRatings,
      [int? statusCode, List<String>? message])
      : super(
            statusCode: statusCode,
            userRatings: rollbackRatings,
            dioException: dioException,
            message: message);
  const RateBookError.fromGenericError(dynamic error)
      : super(error: error);

  @override
  List<Object?> get props => [statusCode, userRatings, dioException, message, error];
}

final class UpdateRatingError extends UserRatingsState {
  const UpdateRatingError(DioException dioException, List<RatingModel> rollbackRatings,
      [int? statusCode, List<String>? message])
      : super(
            statusCode: statusCode,
            userRatings: rollbackRatings,
            dioException: dioException,
            message: message);
  const UpdateRatingError.fromGenericError(dynamic error, List<RatingModel> rollbackRatings)
      : super(error: error);

  @override
  List<Object?> get props => [statusCode, userRatings, dioException, message, error];
}