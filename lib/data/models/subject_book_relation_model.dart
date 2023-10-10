import 'package:bookpal/domain/entities/subject_book_relation.dart';

class SubjectBookRelationModel extends SubjectBookRelation {
  
  const SubjectBookRelationModel({
    required String id,
    required String subjectId,
    required String bookId
  }) : super(
    id: id,
    subjectId: subjectId,
    bookId: bookId
  );

  @override
  factory SubjectBookRelationModel.fromJson(Map<String, dynamic> json) => SubjectBookRelationModel(
    id: json['id'] ?? "",
    subjectId: json['subject_id'] ?? "",
    bookId: json['book_id'] ?? ""
  );

  Map<String, dynamic> toJson() => {
        'id': id,
        'subject_id': subjectId,
        'book_id': bookId,
      };
}
