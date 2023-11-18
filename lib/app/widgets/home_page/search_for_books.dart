import 'package:bookpal/app/pages/list_books/list_books_page.dart';
import 'package:bookpal/presentation/physical_book/remote_bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookSearchField extends StatefulWidget {
  const BookSearchField({super.key});

  @override
  State<BookSearchField> createState() => _BookSearchFieldState();
}

class _BookSearchFieldState extends State<BookSearchField> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final FocusNode _focusNode = FocusNode();

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 0),
      child: Form(
        child: TextFormField(
          key: _formKey,
          controller: _controller,
          focusNode: _focusNode,
          decoration: InputDecoration(
            hintText: 'Search for books',
            hintStyle: TextStyle(color: Theme.of(context).hintColor),
            suffixIcon: IconButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  _focusNode.unfocus();
                  context
                      .read<SearchBloc>()
                      .add(Search(_controller.text.trim()));
                  _controller.clear();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          BlocBuilder<SearchBloc, SearchState>(
                        builder: (context, state) {
                          return const ListBooks(
                            title: 'Search Results',
                          );
                        },
                      ),
                    ),
                  );
                }
              },
              icon: Icon(
                Icons.search,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            fillColor: Theme.of(context).colorScheme.primaryContainer,
            filled: true,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
