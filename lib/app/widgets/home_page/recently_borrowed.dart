import 'package:bookpal/app/widgets/home_page/retry_fecth.dart';
import 'package:bookpal/app/widgets/items/book_cards.dart';
import 'package:bookpal/app/widgets/loading/loading_covers.dart';
import 'package:bookpal/data/models/physical_book_model.dart';
import 'package:bookpal/presentation/loan/remote_bloc/user_borrowed_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecentlyBorrowedBooks extends StatelessWidget {
  const RecentlyBorrowedBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Your Recently Borrowed Books',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'See all',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(24.0, 12.0, 0, 0),
          height: 120,
          child: BlocBuilder<UserBorrowedBloc, UserBorrowedState>(
            builder: (context, state) {
              if (state is UserBorrowedLoading || state is UserBorrowedInitial) {
                return const CardsListShimmer();
              } else if (state is UserBorrowedError) {
                return RetryFetch(
                    fetchMethod: () =>
                        context.read<UserBorrowedBloc>().add(const GetUserBorrowed()));
              }
              return ListView(
                scrollDirection: Axis.horizontal,
                children: _buildRecentlyBorrowedBooks(state.userLoans!
                    .map((e) => e.physicalBook as PhysicalBookModel)
                    .toList()),
              );
            },
          ),
        ),
      ],
    );
  }

  List<Widget> _buildRecentlyBorrowedBooks(List<PhysicalBookModel> books) {
    List<Widget> booksList = [];
    for (var book in books) {
      booksList.add(BookCard1(book));
    }
    return booksList;
  }
}
