part of 'favorite_bloc.dart';

sealed class FavoritesState extends Equatable {

  final List<FavoriteModel>? favoritesList;
  final DioException? dioError;
  final dynamic genericError;
  final int? statusCode;
  final List<String>? message;

  const FavoritesState(
      {this.favoritesList,
      this.dioError,
      this.genericError,
      this.statusCode,
      this.message});
  
  @override
  List<Object?> get props => [favoritesList, dioError, genericError, statusCode];
}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoading extends FavoritesState {}

final class FavoritesLoaded extends FavoritesState {
  const FavoritesLoaded(int statusCode, List<FavoriteModel> favoritesList)
      : super(statusCode: statusCode, favoritesList: favoritesList);

  @override
  List<Object?> get props => [statusCode, favoritesList];
}

final class FavoritesError extends FavoritesState {
  const FavoritesError(DioException dioError,
      [int? statusCode, List<String>? message])
      : super(statusCode: statusCode, dioError: dioError, message: message);
  const FavoritesError.genericError(dynamic genericError)
      : super(genericError: genericError);

  @override
  List<Object?> get props => [statusCode, dioError, message, genericError];
}
