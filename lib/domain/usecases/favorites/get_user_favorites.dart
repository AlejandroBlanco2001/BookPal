import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/core/usecases/usecase.dart';
import 'package:bookpal/domain/entities/favorite.dart';
import 'package:bookpal/domain/repositories/favorite_repository.dart';

class GetUserFavoritesUsecase extends Usecase<DataState<List<Favorite>>> {
  final FavoriteRepository _favoriteRepository;

  GetUserFavoritesUsecase(this._favoriteRepository);

  @override
  Future<DataState<List<Favorite>>> call({void params}) async {
    return await _favoriteRepository.getFavorites();
  }
}