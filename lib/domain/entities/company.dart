

import 'package:bookpal/data/enums/book_scan_method.dart';
import 'package:equatable/equatable.dart';

abstract class Company extends Equatable {
  final String id;
  final String name;
  final List<BookScanMethod> bookScanMethods;
  final String? logo;
  final String? primaryColor;
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