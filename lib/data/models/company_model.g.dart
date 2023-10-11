// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyModel _$CompanyModelFromJson(Map<String, dynamic> json) => CompanyModel(
      id: json['id'] as String,
      name: json['name'] as String,
      bookScanMethods: (json['bookScanMethods'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$BookScanMethodEnumMap, e))
              .toList() ??
          const [BookScanMethod.barcode],
      logo: json['logo'] as String?,
      primaryColor: json['primaryColor'] as String? ?? "#000000",
      secondaryColor: json['secondaryColor'] as String? ?? "#000000",
    );

Map<String, dynamic> _$CompanyModelToJson(CompanyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'bookScanMethods': instance.bookScanMethods
          .map((e) => _$BookScanMethodEnumMap[e]!)
          .toList(),
      'logo': instance.logo,
      'primaryColor': instance.primaryColor,
      'secondaryColor': instance.secondaryColor,
    };

const _$BookScanMethodEnumMap = {
  BookScanMethod.barcode: 'barcode',
  BookScanMethod.rfid: 'rfid',
};
