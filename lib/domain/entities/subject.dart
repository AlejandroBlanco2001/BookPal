

import 'package:equatable/equatable.dart';

abstract class Subject extends Equatable {
  final String id;
  final String name;

  const Subject({
    required this.id,
    required this.name,
  });

  @override  
  List<Object?> get props => [
    id,
    name,
  ];
}