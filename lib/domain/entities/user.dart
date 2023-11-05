
import 'package:bookpal/core/util/utilities.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class User extends Equatable{

  @JsonKey(includeIfNull: false)
	final int? id;
  @JsonKey(name: 'company_id')
	final int companyId;
  @JsonKey(name: 'first_name')
	final String firstName;
  @JsonKey(name: 'second_name')
	final String? secondName;
  @JsonKey(name: 'last_name')
	final String lastName;
  @JsonKey(name: 'second_last_name')
	final String? secondLastName;
  @JsonKey(name: 'date_of_birth', toJson: Utilities.toISO8601String, fromJson: Utilities.fromISO8601String)
	final DateTime dateOfBirth;
	final String email;
	final String password;
  @JsonKey(name: 'academic_program')
	final String? academicProgram;
  @JsonKey(name: 'is_admin')
	final bool isAdmin;
  @JsonKey(name: 'profile_image')
  final String profileImage;
  @JsonKey(name: 'phone_token')
  final String phoneToken;

	const User({
		this.id,
		required this.companyId,
		required this.firstName,
		this.secondName = "",
		required this.lastName,
		this.secondLastName,
		required this.dateOfBirth,
		required this.email,
		required this.password,
		this.academicProgram,
    this.profileImage  = '/default_avatar.jpg',
		this.isAdmin = false,
    required this.phoneToken,
	});

	@override
	List<Object?> get props => [
		id,
		companyId,
		firstName,
		secondName,
		lastName,
		secondLastName,
		dateOfBirth,
		email,
		password,
		academicProgram,
		isAdmin,
	];
}
