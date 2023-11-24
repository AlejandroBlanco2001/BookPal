import 'package:bookpal/app/pages/book_description/book_description_page.dart';
import 'package:bookpal/app/widgets/scanning/select_scan_method_button.dart';
import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/presentation/authentication/bloc/login_bloc.dart';
import 'package:bookpal/presentation/barcode/bloc/barcode_bloc.dart';
import 'package:bookpal/presentation/favorites/bloc/favorite_bloc.dart';
import 'package:bookpal/presentation/loan/remote_bloc/remote_loan_bloc.dart';
import 'package:bookpal/presentation/loan/remote_bloc/user_borrowed_bloc.dart';
import 'package:bookpal/presentation/navigation/bloc/navigation_bloc.dart';
import 'package:bookpal/presentation/navigation/bloc/navigation_pages_bloc.dart';
import 'package:bookpal/presentation/nfc/bloc/nfc_bloc.dart';
import 'package:bookpal/presentation/physical_book/home_books_bloc/home_books_bloc.dart';
import 'package:bookpal/presentation/physical_book/remote_bloc/remote_physical_book_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bookpal/app/widgets/navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:loader_overlay/loader_overlay.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  void _sendSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.black.withOpacity(.7),
        duration: const Duration(seconds: 5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, navState) {
        return BlocListener<LoginBloc, LoginState>(
          listener: (context, loginState) {
            if (loginState is LoginSuccess) {
              context.read<NavigationPagesBloc>().add(const LoggedIn());
              context.read<NavigationBloc>().add(ToHomePage());
              context.read<UserBorrowedBloc>().add(const GetUserBorrowed());
              context.read<FavoritesBloc>().add(const GetUserFavorites());
            } else if (loginState is LoginInitial || loginState is LoginError) {
              context.read<NavigationPagesBloc>().add(const NotLoggedIn());
              context.read<UserBorrowedBloc>().add(const DisposeBorrowed());
              context.read<FavoritesBloc>().add(const DisposeFavorites());
            }
          },
          child: BlocListener<NfcBloc, NfcState>(
            listener: (context, nfcState) {
              if (nfcState is NfcScanned) {
                logger.d(
                    "NFC scanned: ${nfcState.identifier ?? 'Empty response'}");
                Navigator.pop(context);
                context
                    .read<RemotePhysicalBookBloc>()
                    .add(GetPhysicalBook(nfcState.identifier!));
              } else if (nfcState is NfcScanning) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => Dialog(
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    child: SizedBox(
                      height: 100,
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              'Place your phone back to back with the book',
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: JumpingDots(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                              numberOfDots: 3,
                              verticalOffset: 10,
                              innerPadding: 3,
                              radius: 3,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              } else if (nfcState is NfcError) {
                Navigator.pop(context);
              }
            },
            child: BlocListener<BarcodeBloc, BarcodeState>(
              listener: (context, barcodeState) {
                if (barcodeState is BarcodeScanned) {
                  context
                      .read<RemotePhysicalBookBloc>()
                      .add(GetPhysicalBook(barcodeState.barcodeScanRes!));
                }
              },
              child:
                  BlocConsumer<RemotePhysicalBookBloc, RemotePhysicalBookState>(
                listener: (context, state) {
                  if (state is RemotePhysicalBookLoaded) {
                    context.loaderOverlay.hide();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BookDescription(
                            book: state.physicalBook!, scanned: true),
                      ),
                    );
                  } else if (state is RemotePhysicalBookError) {
                    context.loaderOverlay.hide();
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Error'),
                          backgroundColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          content: const Text(
                              'Could not retrieve the scanned book.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Go back'),
                            ),
                          ],
                        );
                      },
                    );
                  } else if (state is RemotePhysicalBookLoading) {
                    context.loaderOverlay.show();
                  }
                },
                builder: (context, state) {
                  return BlocBuilder<NavigationPagesBloc, NavigationPagesState>(
                    builder: (context, navPagesState) {
                      return Scaffold(
                        resizeToAvoidBottomInset: false,
                        floatingActionButton: const SelectScanMethodButton(),
                        floatingActionButtonLocation:
                            FloatingActionButtonLocation.centerDocked,
                        body: BlocListener<RemoteLoanBloc, RemoteLoanState>(
                          listener: (context, state) {
                            if (state is CreateLoanError) {
                              var message = state.message?[0] ?? 'Unknown';
                              if (message == 'Unathorized') {
                                message =
                                    'Please login to your account first...';
                              }
                              _sendSnackBar(context,
                                  'Could not borrow book. Reason: $message');
                            } else if (state is RemoteLoanCreated) {
                              context
                                  .read<UserBorrowedBloc>()
                                  .add(const RefreshBorrowed());
                              if (context
                                  .read<HomeBooksBloc>()
                                  .state
                                  .allBooks
                                  .map((e) => e.barcode)
                                  .contains(state.loan?.physicalBookBarcode ??
                                      'none')) {
                                context
                                    .read<HomeBooksBloc>()
                                    .add(RefreshHomeBooks());
                              }
                              _sendSnackBar(
                                  context, 'Book borrowed successfully');
                            } else if (state is ReturnLoanError) {
                              var message = state.message?[0] ?? 'Unknown';
                              if (message == 'Unathorized') {
                                message =
                                    'Please login to your account first...';
                              }
                              if (context
                                  .read<HomeBooksBloc>()
                                  .state
                                  .allBooks
                                  .map((e) => e.barcode)
                                  .contains(state.loan?.physicalBookBarcode ??
                                      'none')) {
                                context
                                    .read<HomeBooksBloc>()
                                    .add(RefreshHomeBooks());
                              }
                              _sendSnackBar(context,
                                  'Could not return book. Reason: $message');
                            } else if (state is RemoteLoanReturned) {
                              context
                                  .read<UserBorrowedBloc>()
                                  .add(const RefreshBorrowed());
                              _sendSnackBar(
                                  context, 'Book returned successfully');
                            }
                          },
                          child: IndexedStack(
                            index: navState.index,
                            children: navPagesState.pages,
                          ),
                        ),
                        bottomNavigationBar: Visibility(
                          visible:
                              MediaQuery.of(context).viewInsets.bottom == 0,
                          child: MainNavigationBar(
                            currentIndex: navState.index,
                            onTabSelected: _swapPage,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  _swapPage(int index) => context.read<NavigationBloc>().add(SwapPage(index));
}
