import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import '../auth/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  final LoginController _loginController = Get.find<LoginController>();
  final GoogleSignInService _googleSignInService = GoogleSignInService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                  labelStyle:
                      TextStyle(fontSize: 14), // Ukuran teks label lebih kecil
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(width: 1), // Ukuran border lebih kecil
                  ),
                  prefixIcon: Icon(Icons.email),
                  fillColor: Color.fromARGB(255, 229, 208, 172),
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 8, horizontal: 10), // Padding dalam input
                  isDense: true, // Mengurangi tinggi input text
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle:
                      TextStyle(fontSize: 14), // Ukuran teks label lebih kecil
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(width: 1), // Ukuran border lebih kecil
                  ),
                  prefixIcon: Icon(Icons.lock),
                  fillColor: Color.fromARGB(255, 229, 208, 172),
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 8, horizontal: 10), // Padding dalam input
                  isDense: true, // Mengurangi tinggi input text
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
                          _loginController.signInWithEmailAndPassword(
                            _emailController.text,
                            _passwordController.text,
                          );
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
                          'assets/google.png', // Ganti dengan path gambar lokal
                          width: 24, // Sesuaikan ukuran ikon
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
                        onPressed: () async {
                          _loginController.isLoading.value = true;
                          User? user =
                              await _googleSignInService.signInWithGoogle();
                          _loginController.isLoading.value = false;
                          if (user != null) {
                            Get.offNamed('/home');
                          }
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
