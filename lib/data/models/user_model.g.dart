// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String,
      companyId: json['companyId'] as String,
      firstName: json['firstName'] as String,
      secondName: json['secondName'] as String?,
      lastName: json['lastName'] as String,
      secondLastName: json['secondLastName'] as String?,
      dateOfBirth: json['dateOfBirth'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      academicProgram: json['academicProgram'] as String?,
      isAdmin: json['isAdmin'] as bool? ?? false,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'firstName': instance.firstName,
      'secondName': instance.secondName,
      'lastName': instance.lastName,
      'secondLastName': instance.secondLastName,
      'dateOfBirth': instance.dateOfBirth,
      'email': instance.email,
      'password': instance.password,
      'academicProgram': instance.academicProgram,
      'isAdmin': instance.isAdmin,
    };
