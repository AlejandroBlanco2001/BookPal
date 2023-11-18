import 'package:bookpal/app/widgets/book_description/confirmation_dialog.dart';
import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/data/models/physical_book_model.dart';
import 'package:bookpal/presentation/authentication/bloc/login_bloc.dart';
import 'package:bookpal/presentation/loan/remote_bloc/remote_loan_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BorrowButton extends StatelessWidget {
  const BorrowButton({super.key, required this.book});

  final PhysicalBookModel book;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: FittedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return InkWell(
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => ConfirmationDialog(
                      book: book,
                      callback: () {
                        logger.d("Entro a callback");
                        context
                            .read<RemoteLoanBloc>()
                            .add(CreateLoan(book.barcode));
                        Navigator.pop(context);
                      }),
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1.0,
                        offset: Offset(1, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 15, 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Borrow book',
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Icon(
                            Icons.book_outlined,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            size: 32,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
