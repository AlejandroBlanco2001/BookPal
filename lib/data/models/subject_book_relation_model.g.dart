// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_book_relation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectBookRelationModel _$SubjectBookRelationModelFromJson(
        Map<String, dynamic> json) =>
    SubjectBookRelationModel(
      id: json['id'] as String,
      subjectId: json['subjectId'] as String,
      bookId: json['bookId'] as String,
    );

Map<String, dynamic> _$SubjectBookRelationModelToJson(
        SubjectBookRelationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subjectId': instance.subjectId,
      'bookId': instance.bookId,
    };
