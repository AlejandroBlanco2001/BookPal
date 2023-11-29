import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/domain/entities/favorite.dart';

abstract class FavoriteRepository {
  Future<DataState<List<Favorite>>> getFavorites();
  Future<DataState<Favorite>> postFavorite(String bookBarcode);
}