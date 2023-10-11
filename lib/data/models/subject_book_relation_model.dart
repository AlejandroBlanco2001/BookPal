import 'package:bookpal/domain/entities/subject_book_relation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subject_book_relation_model.g.dart';

@JsonSerializable()
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

  factory SubjectBookRelationModel.fromJson(Map<String, dynamic> json) => _$SubjectBookRelationModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectBookRelationModelToJson(this);

}
