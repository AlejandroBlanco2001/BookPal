part of 'favorite_bloc.dart';

sealed class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

final class GetUserFavorites extends FavoritesEvent {
  const GetUserFavorites();
}

final class AddFavorite extends FavoritesEvent {
  final String bookBarcode;

  const AddFavorite(this.bookBarcode);

  @override
  List<Object> get props => [bookBarcode];
}

final class RemoveFavorite extends FavoritesEvent {
  final String bookBarcode;

  const RemoveFavorite(this.bookBarcode);

  @override
  List<Object> get props => [bookBarcode];
}

final class DisposeFavorites extends FavoritesEvent {
  const DisposeFavorites();
}