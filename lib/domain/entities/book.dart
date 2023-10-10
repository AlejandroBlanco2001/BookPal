

import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final String id;
  final String referenceId;
  final String author;
  final String? originalTitle;
  final DateTime? publishDate;

  const Book({
		required this.id,
		required this.referenceId,
		required this.author,
		this.originalTitle,
		this.publishDate
	});

	@override
	List<Object?> get props => [
		id,
		referenceId,
		author,
		originalTitle,
		publishDate
	];
}