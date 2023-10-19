

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

abstract class SubjectBookRelation extends Equatable {

  final int id;
  @JsonKey(name: 'subject_id')
  final int subjectId;
  @JsonKey(name: 'book_id')
  final int bookId;

  const SubjectBookRelation({
    required this.id,
    required this.subjectId,
    required this.bookId
  });

  @override
  List<Object?> get props => [
    id,
    subjectId,
    bookId
  ];

}