// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookModel _$BookModelFromJson(Map<String, dynamic> json) => BookModel(
      id: json['id'] as String,
      referenceId: json['referenceId'] as String,
      author: json['author'] as String,
      originalTitle: json['originalTitle'] as String?,
      publishDate: json['publishDate'] == null
          ? null
          : DateTime.parse(json['publishDate'] as String),
    );

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
      'id': instance.id,
      'referenceId': instance.referenceId,
      'author': instance.author,
      'originalTitle': instance.originalTitle,
      'publishDate': instance.publishDate?.toIso8601String(),
    };
