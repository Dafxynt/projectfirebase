import 'package:flutter/material.dart';
import 'package:flutter_google_signin/controllers/signup_controller.dart';
import 'package:get/get.dart';
import '../service/notifservice.dart'; // Pastikan import NotificationService
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class SignupScreen extends StatelessWidget {
  final SignupController _signupController = Get.find<SignupController>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignupScreen({super.key});

  void _onSignupSuccess() {
    // Memanggil NotificationService dan melewatkan title dan body sebagai string
    NotificationService.showNotificationFromStrings(
        'Sign Up Success', // Title
        'You have successfully signed up!' // Body
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
              CustomTextField(
                controller: _emailController,
                labelText: 'Email',
                prefixIcon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 10),
              CustomTextField(
                controller: _passwordController,
                labelText: 'Password',
                prefixIcon: Icons.lock,
                isPassword: true,
              ),
              SizedBox(height: 30),
              CustomButton(
                text: 'Sign Up',
                onPressed: () async {
                  if (_validateInputs()) {
                    try {
                      await _signupController.createUserWithEmailAndPassword(
                        _emailController.text,
                        _passwordController.text,
                      );

                      _onSignupSuccess();
                    } catch (error) {
                      Get.snackbar(
                        'Error',
                        'Failed to sign up. Please try again.',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                  }
                },
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
