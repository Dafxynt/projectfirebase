import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import '../auth/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../service/notifservice.dart'; // Add import for NotificationService

class LoginScreen extends StatelessWidget {
  final LoginController _loginController = Get.find<LoginController>();
  final GoogleSignInService _googleSignInService = GoogleSignInService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _onLoginSuccess() {
    NotificationService.showNotificationFromStrings(
        "Login Success",
        "You have successfully logged in!"
    );
    Get.offNamed('/home'); // Navigate to home screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 208, 172),
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Color.fromARGB(255, 229, 208, 172),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              Text(
                'Welcome Back',
                textAlign: TextAlign.right,
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
                    borderSide: BorderSide(width: 1),
                  ),
                  prefixIcon: Icon(Icons.email),
                  fillColor: Color.fromARGB(255, 229, 208, 172),
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  isDense: true,
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 1),
                  ),
                  prefixIcon: Icon(Icons.lock),
                  fillColor: Color.fromARGB(255, 229, 208, 172),
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  isDense: true,
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: Obx(() => _loginController.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 163, 29, 29),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    _loginController.isLoading.value = true;
                    _loginController
                        .signInWithEmailAndPassword(
                      _emailController.text,
                      _passwordController.text,
                    )
                        .then((success) {
                      _loginController.isLoading.value = false;

                      if (success) {
                        _onLoginSuccess();  // Call if login is successful
                      } else {
                        NotificationService.showNotificationFromStrings(
                          "Login Failed",
                          "Invalid email or password.",
                        );
                        Get.snackbar(
                          'Login Failed',
                          'Invalid email or password.',
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }
                    }).catchError((error) {
                      _loginController.isLoading.value = false;
                      // Error in login, show notification
                      NotificationService.showNotificationFromStrings(
                        "Error",
                        "Something went wrong. Please try again later.",
                      );
                      Get.snackbar(
                        'Error',
                        'Something went wrong. Please try again later.',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    });
                  },

                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Expanded(child: Divider(color: Colors.black)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'OR',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.black)),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: Obx(() => _loginController.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : ElevatedButton.icon(
                  icon: Image.asset(
                    'assets/google.png', // Replace with your local image path
                    width: 24,
                    height: 24,
                  ),
                  label: Text(
                    'Sign In with Google',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 163, 29, 29),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    _loginController.isLoading.value = true;
                    _googleSignInService.signInWithGoogle().then((user) {
                      _loginController.isLoading.value = false;
                      if (user != null) {
                        _onLoginSuccess(); // Call if login is successful
                      } else {
                        Get.snackbar(
                          'Login Failed',
                          'Google Sign-In was not successful.',
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }
                    }).catchError((error) {
                      _loginController.isLoading.value = false;
                      Get.snackbar(
                        'Error',
                        'Something went wrong with Google Sign-In.',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    });
                  },
                )),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Get.toNamed('/signup');
                },
                child: const Text(
                  'Don\'t have an account? Sign Up',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 10, 37, 83),
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
