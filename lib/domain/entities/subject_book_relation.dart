

import 'package:equatable/equatable.dart';

abstract class SubjectBookRelation extends Equatable {
  final String id;
  final String subjectId;
  final String bookId;

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