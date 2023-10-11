// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'physical_book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhysicalBookModel _$PhysicalBookModelFromJson(Map<String, dynamic> json) =>
    PhysicalBookModel(
      id: json['id'] as String,
      barcode: json['barcode'] as String,
      referenceId: json['referenceId'] as String,
      title: json['title'] as String,
      edition: json['edition'] as String?,
      deweyCode: json['deweyCode'] as String,
      creationDate: DateTime.parse(json['creationDate'] as String),
      isbn: json['isbn'] as String?,
      isbn13: json['isbn13'] as String?,
      publisher: json['publisher'] as String?,
      publishDate: json['publishDate'] == null
          ? null
          : DateTime.parse(json['publishDate'] as String),
      language: json['language'] as String?,
      status: $enumDecodeNullable(_$BookStatusEnumMap, json['status']) ??
          BookStatus.available,
      bibliographicGps: json['bibliographicGps'] as String?,
    );

Map<String, dynamic> _$PhysicalBookModelToJson(PhysicalBookModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'barcode': instance.barcode,
      'referenceId': instance.referenceId,
      'title': instance.title,
      'edition': instance.edition,
      'deweyCode': instance.deweyCode,
      'creationDate': instance.creationDate.toIso8601String(),
      'isbn': instance.isbn,
      'isbn13': instance.isbn13,
      'publisher': instance.publisher,
      'publishDate': instance.publishDate?.toIso8601String(),
      'language': instance.language,
      'status': _$BookStatusEnumMap[instance.status]!,
      'bibliographicGps': instance.bibliographicGps,
    };

const _$BookStatusEnumMap = {
  BookStatus.available: 'available',
  BookStatus.unavailable: 'unavailable',
};
