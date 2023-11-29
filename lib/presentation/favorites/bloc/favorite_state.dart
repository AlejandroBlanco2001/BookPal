part of 'favorite_bloc.dart';

sealed class FavoritesState extends Equatable {

  final List<FavoriteModel> favoritesList;
  final DioException? dioError;
  final dynamic genericError;
  final int? statusCode;
  final List<String>? message;

  const FavoritesState(
      {this.favoritesList = const [],
      this.dioError,
      this.genericError,
      this.statusCode,
      this.message});
  
  @override
  List<Object?> get props => [favoritesList, dioError, genericError, statusCode];
}

final class FavoritesInitial extends FavoritesState {}

final class FetchingFavorites extends FavoritesState {}

final class FavoritesFetched extends FavoritesState {
  const FavoritesFetched(int statusCode, List<FavoriteModel> favoritesList)
      : super(statusCode: statusCode, favoritesList: favoritesList);

  @override
  List<Object?> get props => [statusCode, favoritesList];
}

final class FavoritesUpdated extends FavoritesState {
  const FavoritesUpdated(List<FavoriteModel> favoritesList, [int? statusCode])
      : super(favoritesList: favoritesList, statusCode: statusCode);

  @override
  List<Object?> get props => [favoritesList, statusCode];
}

final class FavoritesUpdatedTemp extends FavoritesState {
  const FavoritesUpdatedTemp(List<FavoriteModel> favoritesList,
      [int? statusCode])
      : super(favoritesList: favoritesList, statusCode: statusCode);

  @override
  List<Object?> get props => [favoritesList, statusCode];
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

final class AddFavoriteError extends FavoritesState {
  const AddFavoriteError(DioException dioError, List<FavoriteModel> rollbackFavorites,
      [int? statusCode, List<String>? message])
      : super(statusCode: statusCode, favoritesList: rollbackFavorites, dioError: dioError, message: message);
  const AddFavoriteError.genericError(dynamic genericError, List<FavoriteModel> rollbackFavorites)
      : super(genericError: genericError, favoritesList: rollbackFavorites);

  @override
  List<Object?> get props => [statusCode, favoritesList, dioError, message, genericError];
}

final class RemoveFavoriteError extends FavoritesState {
  const RemoveFavoriteError(DioException dioError, List<FavoriteModel> rollbackFavorites,
      [int? statusCode, List<String>? message])
      : super(statusCode: statusCode, favoritesList: rollbackFavorites, dioError: dioError, message: message);
  const RemoveFavoriteError.genericError(dynamic genericError, List<FavoriteModel> rollbackFavorites)
      : super(genericError: genericError, favoritesList: rollbackFavorites);

  @override
  List<Object?> get props => [statusCode, favoritesList, dioError, message, genericError];
}