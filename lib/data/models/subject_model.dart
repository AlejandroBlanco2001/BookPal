

import 'package:bookpal/domain/entities/subject.dart';

class SubjectModel extends Subject {
  const SubjectModel({
    required String id,
    required String name
  }) : super(
          id: id,
          name: name
        );

  @override
  factory SubjectModel.fromJson(Map<String, dynamic> json) => SubjectModel(
    id: json['id'] ?? "",
    name: json['name'] ?? ""
  );
}