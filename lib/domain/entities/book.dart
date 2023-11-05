

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:bookpal/core/util/utilities.dart';


class Book extends Equatable {
  final int id;
  @JsonKey(name: 'reference_id')
  final int referenceId;
  final String author;
  @JsonKey(name: 'original_title')
  final String? originalTitle;
  @JsonKey(name: 'publish_date', fromJson: Utilities.fromISO8601String, toJson: Utilities.toISO8601String)
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