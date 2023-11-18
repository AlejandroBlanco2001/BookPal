// import 'package:bookpal/core/util/utilities.dart';
// import 'package:flutter/material.dart';

// class SignupPage extends StatefulWidget {
//   const SignupPage({super.key});

//   @override
//   State<SignupPage> createState() => _SignupPageState();
// }

// class _SignupPageState extends State<SignupPage> {
//   @override
//   void initState() {
//     _controllerAcademicProgram.text = '<Select your academic program>';
//     super.initState();
//   }

//   final List<String> _programs = [
//     'Computer Science',
//     'Politics',
//     'Economics',
//     'Business Administration',
//     'Law',
//     'Medicine',
//     'Psychology',
//   ];

//   final GlobalKey<FormState> _formKey = GlobalKey();

//   final FocusNode _focusNodeSecondName = FocusNode();
//   final FocusNode _focusNodeLastName = FocusNode();
//   final FocusNode _focusNodeSecondLastName = FocusNode();
//   final FocusNode _focusNodeEmail = FocusNode();
//   final FocusNode _focusNodeAcademicProgram = FocusNode();
//   final FocusNode _focusNodeBirthDate = FocusNode();
//   final FocusNode _focusNodePassword = FocusNode();
//   final FocusNode _focusNodeConfirmPassword = FocusNode();
//   final TextEditingController _controllerFirstName = TextEditingController();
//   final TextEditingController _controllerSecondName = TextEditingController();
//   final TextEditingController _controllerLastName = TextEditingController();
//   final TextEditingController _controllerSecondLastName =
//       TextEditingController();
//   final TextEditingController _controllerEmail = TextEditingController();
//   final TextEditingController _controllerAcademicProgram =
//       TextEditingController();
//   final TextEditingController _controllerBirthDate = TextEditingController();
//   final TextEditingController _controllerPassword = TextEditingController();
//   final TextEditingController _controllerConFirmPassword =
//       TextEditingController();

//   bool _obscurePassword = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.primaryContainer,
//       body: Form(
//         key: _formKey,
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 30.0),
//           child: Column(
//             children: [
//               const SizedBox(height: 100),
//               Text(
//                 "Register",
//                 style: Theme.of(context).textTheme.headlineLarge,
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 "Create your account",
//                 style: Theme.of(context).textTheme.bodyMedium,
//               ),
//               const SizedBox(height: 35),
//               Row(
//                 children: [
//                   TextFormField(
//                     controller: _controllerFirstName,
//                     keyboardType: TextInputType.name,
//                     decoration: InputDecoration(
//                       labelText: "First Name",
//                       // prefixIcon: const Icon(Icons.person_outline),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     validator: (String? value) {
//                       if (value == null || value.isEmpty) {
//                         return "Please enter your first name.";
//                       }
//                       return null;
//                     },
//                     onEditingComplete: () =>
//                         _focusNodeSecondName.requestFocus(),
//                   ),
//                   const SizedBox(width: 15),
//                   TextFormField(
//                     controller: _controllerSecondName,
//                     focusNode: _focusNodeSecondName,
//                     keyboardType: TextInputType.name,
//                     decoration: InputDecoration(
//                       labelText: "Second Name",
//                       // prefixIcon: const Icon(Icons.person_outline),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     onEditingComplete: () => _focusNodeLastName.requestFocus(),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               Row(
//                 children: [
//                   TextFormField(
//                     controller: _controllerLastName,
//                     focusNode: _focusNodeLastName,
//                     keyboardType: TextInputType.name,
//                     decoration: InputDecoration(
//                       labelText: "Last Name",
//                       // prefixIcon: const Icon(Icons.person_outline),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     validator: (String? value) {
//                       if (value == null || value.isEmpty) {
//                         return "Please enter your last name.";
//                       }
//                       return null;
//                     },
//                     onEditingComplete: () =>
//                         _focusNodeSecondLastName.requestFocus(),
//                   ),
//                   const SizedBox(width: 15),
//                   TextFormField(
//                     controller: _controllerSecondLastName,
//                     focusNode: _focusNodeSecondLastName,
//                     keyboardType: TextInputType.name,
//                     decoration: InputDecoration(
//                       labelText: "Second Last Name",
//                       // prefixIcon: const Icon(Icons.person_outline),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     validator: (String? value) {
//                       if (value == null || value.isEmpty) {
//                         return "Please enter your second last name.";
//                       }
//                       return null;
//                     },
//                     onEditingComplete: () => _focusNodeEmail.requestFocus(),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               TextFormField(
//                 controller: _controllerEmail,
//                 focusNode: _focusNodeEmail,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//                   labelText: "Email",
//                   prefixIcon: const Icon(Icons.email_outlined),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 validator: (String? value) {
//                   if (value == null || value.isEmpty) {
//                     return "Please enter email.";
//                   } else if (!(Utilities.validateEmail(value))) {
//                     return "Invalid email";
//                   }
//                   return null;
//                 },
//                 onEditingComplete: () =>
//                     _focusNodeAcademicProgram.requestFocus(),
//               ),
//               const SizedBox(height: 10),
//               FormField<String>(
//                 builder: (FormFieldState<String> state) {
//                   return InputDecorator(
//                     decoration: InputDecoration(
//                         errorStyle:
//                             const TextStyle(color: Colors.redAccent, fontSize: 16.0),
//                         hintText: 'Please select your academic program',
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5.0))),
//                     isEmpty: _controllerAcademicProgram.text == '',
//                     child: DropdownButtonHideUnderline(
//                       child: DropdownButton<String>(
//                         value: _controllerAcademicProgram.text,
//                         isDense: true,
//                         onChanged: (String? newValue) {
//                           if (newValue != null) {
//                             setState(() {
//                               _controllerAcademicProgram.text = newValue;
//                               state.didChange(newValue);
//                             });
//                           }
//                         },
//                         items: _programs.map((String value) {
//                           return DropdownMenuItem<String>(
//                             value: value,
//                             child: Text(value),
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                   );
//                 },
//                 validator: (String? value) {
//                   if (value == null || value.isEmpty) {
//                     return "Please enter your academic program.";
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 10),
//               TextFormField(
//                 controller: _controllerBirthDate,
//                 focusNode: _focusNodeBirthDate,
//                 keyboardType: TextInputType.datetime,
//                 decoration: InputDecoration(
//                   labelText: "Birth Date",
//                   icon: const Icon(Icons.calendar_today_outlined),
//                   // prefixIcon: const Icon(Icons.person_outline),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 onTap: () async {
//                   var pickedDate = await showDatePicker(
//                     context: context,
//                     initialDate: DateTime(DateTime.now().year - 12),
//                     firstDate: DateTime(1900),
//                     lastDate: DateTime.now(),
//                   );
//                   if (pickedDate != null) {
//                     setState(() {
//                       _controllerBirthDate.text =
//                           Utilities.toISO8601String(pickedDate)!;
//                     });
//                   }
//                 },
//                 validator: (String? value) {
//                   if (value == null || value.isEmpty) {
//                     return "Please select your birth date.";
//                   }
//                   return null;
//                 },
//                 onEditingComplete: () => _focusNodePassword.requestFocus(),
//               ),
//               const SizedBox(height: 10),
//               TextFormField(
//                 controller: _controllerPassword,
//                 obscureText: _obscurePassword,
//                 focusNode: _focusNodePassword,
//                 keyboardType: TextInputType.visiblePassword,
//                 decoration: InputDecoration(
//                   labelText: "Password",
//                   prefixIcon: const Icon(Icons.password_outlined),
//                   suffixIcon: IconButton(
//                       onPressed: () {
//                         setState(() {
//                           _obscurePassword = !_obscurePassword;
//                         });
//                       },
//                       icon: _obscurePassword
//                           ? const Icon(Icons.visibility_outlined)
//                           : const Icon(Icons.visibility_off_outlined)),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 validator: (String? value) {
//                   if (value == null || value.isEmpty) {
//                     return "Please enter password.";
//                   } else if (value.length < 8) {
//                     return "Password must be at least 8 character.";
//                   }
//                   return null;
//                 },
//                 onEditingComplete: () =>
//                     _focusNodeConfirmPassword.requestFocus(),
//               ),
//               const SizedBox(height: 10),
//               TextFormField(
//                 controller: _controllerConFirmPassword,
//                 obscureText: _obscurePassword,
//                 focusNode: _focusNodeConfirmPassword,
//                 keyboardType: TextInputType.visiblePassword,
//                 decoration: InputDecoration(
//                   labelText: "Confirm Password",
//                   prefixIcon: const Icon(Icons.password_outlined),
//                   suffixIcon: IconButton(
//                       onPressed: () {
//                         setState(() {
//                           _obscurePassword = !_obscurePassword;
//                         });
//                       },
//                       icon: _obscurePassword
//                           ? const Icon(Icons.visibility_outlined)
//                           : const Icon(Icons.visibility_off_outlined)),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 validator: (String? value) {
//                   if (value == null || value.isEmpty) {
//                     return "Please enter password.";
//                   } else if (value != _controllerPassword.text) {
//                     return "Password doesn't match.";
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 50),
//               Column(
//                 children: [
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: const Size.fromHeight(50),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                     onPressed: () {
//                       if (_formKey.currentState?.validate() ?? false) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             width: 200,
//                             backgroundColor:
//                                 Theme.of(context).colorScheme.secondary,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             behavior: SnackBarBehavior.floating,
//                             content: const Text("Registered Successfully"),
//                           ),
//                         );

//                         _formKey.currentState?.reset();

//                         Navigator.pop(context);
//                       }
//                     },
//                     child: const Text("Register"),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text("Already have an account?"),
//                       TextButton(
//                         onPressed: () => Navigator.pop(context),
//                         child: const Text("Login"),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _focusNodeSecondName.dispose();
//     _focusNodeLastName.dispose();
//     _focusNodeSecondLastName.dispose();
//     _focusNodeEmail.dispose();
//     _focusNodeAcademicProgram.dispose();
//     _focusNodeBirthDate.dispose();
//     _focusNodePassword.dispose();
//     _focusNodeConfirmPassword.dispose();
//     _controllerFirstName.dispose();
//     _controllerSecondName.dispose();
//     _controllerLastName.dispose();
//     _controllerSecondLastName.dispose();
//     _controllerEmail.dispose();
//     _controllerAcademicProgram.dispose();
//     _controllerBirthDate.dispose();
//     _controllerPassword.dispose();
//     _controllerConFirmPassword.dispose();
//     super.dispose();
//   }
// }
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();
  final FocusNode _focusNodeConfirmPassword = FocusNode();
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerConFirmPassword =
      TextEditingController();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              const SizedBox(height: 100),
              Text(
                "Register",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 10),
              Text(
                "Create your account",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 35),
              TextFormField(
                controller: _controllerUsername,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "Username",
                  prefixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (String? value) {

                  return null;
                },
                onEditingComplete: () => _focusNodeEmail.requestFocus(),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _controllerEmail,
                focusNode: _focusNodeEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter email.";
                  } else if (!(value.contains('@') && value.contains('.'))) {
                    return "Invalid email";
                  }
                  return null;
                },
                onEditingComplete: () => _focusNodePassword.requestFocus(),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _controllerPassword,
                obscureText: _obscurePassword,
                focusNode: _focusNodePassword,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: const Icon(Icons.password_outlined),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      icon: _obscurePassword
                          ? const Icon(Icons.visibility_outlined)
                          : const Icon(Icons.visibility_off_outlined)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter password.";
                  } else if (value.length < 8) {
                    return "Password must be at least 8 character.";
                  }
                  return null;
                },
                onEditingComplete: () =>
                    _focusNodeConfirmPassword.requestFocus(),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _controllerConFirmPassword,
                obscureText: _obscurePassword,
                focusNode: _focusNodeConfirmPassword,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  prefixIcon: const Icon(Icons.password_outlined),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      icon: _obscurePassword
                          ? const Icon(Icons.visibility_outlined)
                          : const Icon(Icons.visibility_off_outlined)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter password.";
                  } else if (value != _controllerPassword.text) {
                    return "Password doesn't match.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 50),
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            width: 200,
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            behavior: SnackBarBehavior.floating,
                            content: const Text("Registered Successfully"),
                          ),
                        );

                        _formKey.currentState?.reset();

                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Register"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Login"),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNodeEmail.dispose();
    _focusNodePassword.dispose();
    _focusNodeConfirmPassword.dispose();
    _controllerUsername.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    _controllerConFirmPassword.dispose();
    super.dispose();
  }
}