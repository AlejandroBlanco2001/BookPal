

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

abstract class Reference extends Equatable {

  final int id;
  @JsonKey(name: 'numerical_id')
  final int numericalId;
  @JsonKey(name: 'reference_name')
  final String referenceName;

  const Reference({
    required this.id,
    required this.numericalId,
    required this.referenceName,
  });

  @override
  List<Object?> get props => [
    id,
    numericalId,
    referenceName,
  ];
}