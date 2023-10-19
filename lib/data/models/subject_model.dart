

import 'package:bookpal/domain/entities/subject.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subject_model.g.dart';

@JsonSerializable()
class SubjectModel extends Subject {
  const SubjectModel({
    required int id,
    required String name
  }) : super(
          id: id,
          name: name
        );

  factory SubjectModel.fromJson(Map<String, dynamic> json) => _$SubjectModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectModelToJson(this);
  
}