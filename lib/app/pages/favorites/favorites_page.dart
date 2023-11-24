import 'package:bookpal/app/widgets/home_page/retry_fecth.dart';
import 'package:bookpal/app/widgets/items/book_cards.dart';
import 'package:bookpal/app/widgets/loading/empty_book_list.dart';
import 'package:bookpal/app/widgets/loading/loading_list.dart';
import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/data/models/favorite_model.dart';
import 'package:bookpal/presentation/favorites/bloc/favorite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 48,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: Text(
                'Favorites',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            BlocBuilder<FavoritesBloc, FavoritesState>(
              builder: (context, state) {
                if (state is FetchingFavorites || state is FavoritesInitial) {
                  return const ListBooksShimmer();
                } else if (state is FavoritesError) {
                  return RetryFetch(
                      fetchMethod: () =>
                          context.read<FavoritesBloc>().add(FetchUserFavorites()));
                }
                if (state.favoritesList.isEmpty) {
                  return const EmptyBookList(title: "You haven't added any book to your favorites yet");
                }
                return ListView(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  children: _buildFavoriteBooks(state.favoritesList),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildFavoriteBooks(List<FavoriteModel> favorites) {
    List<Widget> favoritesList = [];
    logger.d("Reconstruyendo favoritos: ${favorites.length}. Libros: ${favorites.map((e) => e.physicalBook!.title)}");
    for (var favorite in favorites) {
      favoritesList.add(BookCard2.fromFavorite(
        favorite: favorite,
      ));
    }
    return favoritesList;
  }
}
