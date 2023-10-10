

import 'package:equatable/equatable.dart';

abstract class Reference extends Equatable {
  final String id;
  final String numericalId;
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