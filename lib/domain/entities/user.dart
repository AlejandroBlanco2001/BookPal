
import 'package:equatable/equatable.dart';

class User extends Equatable{

	final String id;
	final String companyId;
	final String firstName;
	final String? secondName;
	final String lastName;
	final String? secondLastName;
	final String dateOfBirth;
	final String email;
	final String password;
	final String? academicProgram;
	final bool isAdmin;
  final String profilePicture;

	const User({
		required this.id,
		required this.companyId,
		required this.firstName,
		this.secondName = "",
		required this.lastName,
		this.secondLastName,
		required this.dateOfBirth,
		required this.email,
		required this.password,
		this.academicProgram,
    this.profilePicture  = '/default_avatar.jpg',
		this.isAdmin = false,
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
