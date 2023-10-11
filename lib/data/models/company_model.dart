

import 'package:bookpal/data/enums/book_scan_method.dart';
import 'package:bookpal/domain/entities/company.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company_model.g.dart';

@JsonSerializable()
class CompanyModel extends Company {
  const CompanyModel({
    required String id,
    required String name,
    List<BookScanMethod> bookScanMethods = const [BookScanMethod.barcode],
    String? logo,
    String? primaryColor = "#000000",
    String? secondaryColor = "#000000",
  }) : super(
    id: id,
    name: name,
    bookScanMethods: bookScanMethods,
    logo: logo,
    primaryColor: primaryColor,
    secondaryColor: secondaryColor,
  );

  factory CompanyModel.fromJson(Map<String, dynamic> json) => _$CompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyModelToJson(this);
  
}