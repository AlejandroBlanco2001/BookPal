
import 'package:bookpal/app/widgets/home_page/retry_fecth.dart';
import 'package:bookpal/app/widgets/items/book_cards.dart';
import 'package:bookpal/app/widgets/loading/empty_book_list.dart';
import 'package:bookpal/app/widgets/loading/loading_popular.dart';
import 'package:bookpal/data/models/loan_model.dart';
import 'package:bookpal/presentation/loan/remote_bloc/user_borrowed_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Borrowed extends StatelessWidget {
  const Borrowed({super.key});

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
                'Your Books',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            BlocBuilder<UserBorrowedBloc, UserBorrowedState>(
              builder: (context, state) {
                if (state is UserBorrowedLoading || state is UserBorrowedInitial) {
                  return const PopularBooksShimmer();
                } else if (state is UserBorrowedError) {
                  return RetryFetch(
                      fetchMethod: () =>
                          context.read<UserBorrowedBloc>().add(const GetUserBorrowed()));
                }
                if (state.userLoans.isEmpty) {
                  return const EmptyBookList(title: "You haven't borrowed any books yet");
                }
                return ListView(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  children: _buildRecentlyBorrowedBooks(state.userLoans),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> _buildRecentlyBorrowedBooks(List<LoanModel> loans) {
  List<Widget> loansList = [];
  for (var loan in loans) {
    loansList.add(BookCard2.fromLoan(
      loan: loan,
    ));
  }
  return loansList;
}
