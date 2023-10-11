

import 'package:bookpal/domain/entities/reference.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reference_model.g.dart';

@JsonSerializable()
class ReferenceModel extends Reference {

  const ReferenceModel({
    required String id,
    required String numericalId,
    required String referenceName,
  }) : super(
    id: id,
    numericalId: numericalId,
    referenceName: referenceName,
  );

  factory ReferenceModel.fromJson(Map<String, dynamic> json) => _$ReferenceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReferenceModelToJson(this);

}