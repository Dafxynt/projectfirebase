import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import '../auth/google_sign_in.dart';
import '../service/notifservice.dart'; // Add import for NotificationService
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  final LoginController _loginController = Get.find<LoginController>();
  final GoogleSignInService _googleSignInService = GoogleSignInService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  void _onLoginSuccess() {
    NotificationService.showNotificationFromStrings(
        "Login Success", "You have successfully logged in!");
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
              SizedBox(height: 20),
              Obx(() => CustomButton(
                    text: 'Login',
                    isLoading: _loginController.isLoading.value,
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
                          _onLoginSuccess(); // Call if login is successful
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
                  )),
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
              Obx(() => CustomButton(
                    text: 'Sign In with Google',
                    isLoading: _loginController.isLoading.value,
                    icon: Image.asset(
                      'assets/google.png',
                      width: 24,
                      height: 24,
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
