import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../controllers/logout_controller.dart';
import '../widgets/custom_button.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LogoutController logoutController = Get.find<LogoutController>();
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color.fromARGB(255, 229, 208, 172),
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: user?.photoURL != null
                    ? NetworkImage(user!.photoURL!)
                    : AssetImage('assets/profile.jpg') as ImageProvider,
              ),
              SizedBox(height: 16),
              Text(
                user?.displayName ?? "Nama Pengguna",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(height: 8),
              Text(
                user?.email ?? "email@example.com",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(height: 32),
              CustomButton(
                text: "Logout",
                onPressed: () async {
                  await logoutController.logout();
                  Get.offAll(() => LoginScreen());
                },
                backgroundColor: Colors.red,
                width: 200,
                height: 45,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
