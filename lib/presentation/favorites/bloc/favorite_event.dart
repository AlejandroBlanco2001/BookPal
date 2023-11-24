part of 'favorite_bloc.dart';

sealed class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

final class FetchUserFavorites extends FavoritesEvent {}

final class RefreshFavorites extends FavoritesEvent {
  const RefreshFavorites();
}

final class AddFavorite extends FavoritesEvent {
  final PhysicalBookModel book;

  const AddFavorite(this.book);

  @override
  List<Object> get props => [book];
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
