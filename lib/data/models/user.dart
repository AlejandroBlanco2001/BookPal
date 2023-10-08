import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required String id,
    required String companyId,
    required String firstName,
    String? secondName,
    required String lastName,
    String? secondLastName,
    required String dateOfBirth,
    required String email,
    required String password,
    required String academicProgram,
    required String isAdmin,
  }) : super(
          id: id,
          companyId: companyId,
          firstName: firstName,
          secondName: secondName,
          lastName: lastName,
          secondLastName: secondLastName,
          dateOfBirth: dateOfBirth,
          email: email,
          password: password,
          academicProgram: academicProgram,
          isAdmin: isAdmin,
        );
  
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] ?? "",
        companyId: json['companyId'] ?? "",
        firstName: json['firstName'] ?? "",
        secondName: json['secondName'],
        lastName: json['lastName'] ?? "",
        secondLastName: json['secondLastName'],
        dateOfBirth: json['dateOfBirth'] ?? "",
        email: json['email'] ?? "",
        password: json['password'] ?? "",
        academicProgram: json['academicProgram'] ?? "",
        isAdmin: json['isAdmin'] ?? "",
      );
}