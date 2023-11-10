import 'package:bookpal/app/widgets/profile_page/logout_button.dart';
import 'package:bookpal/app/widgets/profile_page/settings_card.dart';
import 'package:bookpal/core/constants/constants.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: const Icon(Icons.chevron_left, size: 32),
        title: const Text(
          'Your profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: const Color(0xffF5F5F5),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Colors.grey)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        child: Container(
                          width: 100,
                          height: 100,
                          color: Colors.grey,
                          child: const Image(
                              image: NetworkImage(
                                  'https://www.cu.edu.ph/wp-content/uploads/2020/10/girl-avatar.png')),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'John Doe',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'jhondoe@gmail.com',
                            style: TextStyle(
                              color: Color.fromARGB(255, 73, 39, 176),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SettingsCard(title: 'Modify your user info', callback: () {logger.d("Quiere modificar su info");}),
            SettingsCard(title: 'Change your password', callback: () {logger.d("Quiere cambiar su contraseña");}),
            const LogoutButton(),
          ],
        ),
      ),
    );
  }
}
