import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter_google_signin/controllers/logout_controller.dart'; // Import controller yang sudah dibuat
import 'login_screen.dart'; // Halaman Login

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mendapatkan controller dengan GetX
    final LogoutController logoutController = Get.find<LogoutController>();

    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
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
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              user?.email ?? "email@example.com",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Memanggil method logout dari controller
                await logoutController.logout();
                // Arahkan ke halaman Login setelah logout
                Get.offAll(() => LoginScreen());  // Get.offAll untuk mengganti halaman secara permanen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text("Logout", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
