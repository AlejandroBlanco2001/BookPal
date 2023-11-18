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
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                onTap: () =>
                    context.read<NavigationBloc>().add(const SwapPage(1)),
                child: Expanded(
                  child: Text(
                    'See all',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(24.0, 12.0, 0, 40),
          height: 135,
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is LoginSuccess) {
                return BlocBuilder<UserBorrowedBloc, UserBorrowedState>(
                  builder: (context, state) {
                    if (state is UserBorrowedLoading ||
                        state is UserBorrowedInitial) {
                      return const CardsListShimmer();
                    } else if (state is UserBorrowedError) {
                      return RetryFetch(
                          fetchMethod: () => context
                              .read<UserBorrowedBloc>()
                              .add(const GetUserBorrowed()));
                    }
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: _buildRecentlyBorrowedBooks(state.userLoans!),
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
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                ),
              );
            },
          ),
        ),
      ],
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
