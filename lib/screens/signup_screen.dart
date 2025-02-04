import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/signup_controller.dart';
import '../service/notifservice.dart';  // Pastikan import NotificationService

class SignupScreen extends StatelessWidget {
  final SignupController _signupController = Get.find<SignupController>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _onSignupSuccess() {
    // Memanggil NotificationService dan melewatkan title dan body sebagai string
    NotificationService.showNotificationFromStrings(
        'Sign Up Success',  // Title
        'You have successfully signed up!'  // Body
    );
    Get.offNamed('/login'); // Pindah ke halaman login setelah berhasil
  }

  bool _validateInputs() {
    // Memeriksa apakah email dan password sudah diisi
    if (_emailController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your email address.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
    if (_passwordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your password.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
    return true; // Validasi berhasil, input sudah terisi
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 208, 172),
      appBar: AppBar(
        title: Text('Sign Up'),
        backgroundColor: Color.fromARGB(255, 229, 208, 172),
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontFamily: 'Roboto',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              Text(
                'Create an Account',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(
                    Icons.email,
                    size: 20,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 10,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    size: 20,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 10,
                  ),
                ),
                obscureText: true,
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 163, 29, 29),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    if (_validateInputs()) {
                      try {
                        // Lakukan signup dan tunggu proses selesai
                        await _signupController.createUserWithEmailAndPassword(
                          _emailController.text,
                          _passwordController.text,
                        );

                        // Jika signup berhasil, tampilkan notifikasi dan arahkan ke halaman login
                        _onSignupSuccess();
                      } catch (error) {
                        // Jika ada error, tampilkan snackbar error
                        Get.snackbar(
                          'Error',
                          'Failed to sign up. Please try again.',
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }
                    }
                  },
                  child: Text('Sign Up'),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Get.toNamed('/login');
                },
                child: Text(
                  'Already have an account? Log In',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 46, 123, 255),
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
