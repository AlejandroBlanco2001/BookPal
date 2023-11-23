import 'package:bookpal/app/widgets/home_page/retry_fecth.dart';
import 'package:bookpal/app/widgets/items/book_cards.dart';
import 'package:bookpal/app/widgets/loading/loading_covers.dart';
import 'package:bookpal/data/models/loan_model.dart';
import 'package:bookpal/presentation/authentication/bloc/login_bloc.dart';
import 'package:bookpal/presentation/loan/remote_bloc/user_borrowed_bloc.dart';
import 'package:bookpal/presentation/navigation/bloc/navigation_bloc.dart';
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
              Expanded(
                child: Text(
                  'Your Recently Borrowed Books',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                onPressed: () =>
                    context.read<NavigationBloc>().add(const SwapPage(1)),
                child: Text(
                  'See all',
                  style: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.8),
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        BlocBuilder<LoginBloc, LoginState>(
          builder: (context, loginState) {
            if (loginState is LoginSuccess) {
              return BlocBuilder<UserBorrowedBloc, UserBorrowedState>(
                builder: (context, borrowedState) {
                  double height = 0;
                  if (borrowedState.userLoans.isEmpty && borrowedState is! UserBorrowedLoading) {
                    height = 50;
                  } else {
                    height = 135;
                  }
                  return Container(
                    margin: const EdgeInsets.fromLTRB(24.0, 12.0, 0, 40),
                    height: height,
                    child: _decideBorrowedBody(context, borrowedState),
                  );
                },
              );
            }
            return Center(
              child: Text(
                'Please login to see your recently \nborrowed books...',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            );
          },
        ),
      ],
    );
  }

  _decideBorrowedBody(BuildContext context, UserBorrowedState state) {
    if (state is UserBorrowedLoading || state is UserBorrowedInitial) {
      return const CardsListShimmer();
    } else if (state is UserBorrowedError) {
      return RetryFetch(
          fetchMethod: () =>
              context.read<UserBorrowedBloc>().add(const GetUserBorrowed()));
    }
    if (state.userLoans.isEmpty) {
      return Center(
        child: Text(
          'You have no borrowed books...',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 14,
              fontWeight: FontWeight.normal),
        ),
      );
    }
    return ListView(
      scrollDirection: Axis.horizontal,
      children: _buildRecentlyBorrowedBooks(state.userLoans),
    );
  }

  List<Widget> _buildRecentlyBorrowedBooks(List<LoanModel> loans) {
    List<Widget> loansList = [];
    for (var loan in loans) {
      loansList.add(BookCard1(loan));
    }
    return loansList;
  }
}
