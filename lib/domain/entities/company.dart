

import 'package:bookpal/data/enums/book_scan_method.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

abstract class Company extends Equatable {
  final int id;
  final String name;
  @JsonKey(name: 'book_scan_methods')
  final List<BookScanMethod> bookScanMethods;
  final String? logo;
  @JsonKey(name: 'primary_color')
  final String? primaryColor;
  @JsonKey(name: 'secondary_color')
  final String? secondaryColor;

  const Company({
    required this.id,
    required this.name,
    this.bookScanMethods = const [BookScanMethod.barcode],
    this.logo = '/default_logo.png',
    this.primaryColor = "#000000",
    this.secondaryColor = "#000000",
  });

  @override
  List<Object?> get props => [
    id,
    name,
    bookScanMethods,
    logo,
    primaryColor,
    secondaryColor,
  ];
}