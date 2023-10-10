

import 'package:bookpal/domain/entities/reference.dart';

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

  @override
  factory ReferenceModel.fromJson(Map<String, dynamic> json) => ReferenceModel(
    id: json['id'] ?? "",
    numericalId: json['numericalId'] ?? "",
    referenceName: json['referenceName'] ?? "",
  );
}