// lib/screens/welcome_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(
            //   'assets/hellorendra.png', // Pastikan gambar ini ada di folder assets
            //   width: 250,
            //   height: 250,
            //   fit: BoxFit.contain,
            // ),
            const SizedBox(height: 30),
            RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 20, color: Colors.black),
                children: [
                  TextSpan(text: 'Selamat datang di '),
                  TextSpan(
                    text: 'Absenin',
                    style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 300,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  onPressed: () => Get.toNamed('/login'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 163, 29, 29),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 2,
                  ),
                  child: const Text(
                    'Go to Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
