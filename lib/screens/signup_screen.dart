   import 'package:flutter/material.dart';
   import 'package:get/get.dart';
   import '../controllers/signup_controller.dart';

   class SignupScreen extends StatelessWidget {
     final SignupController _signupController = Get.find<SignupController>();
     final TextEditingController _emailController = TextEditingController();
     final TextEditingController _passwordController = TextEditingController();

     @override
     Widget build(BuildContext context) {
       return Scaffold(
         appBar: AppBar(title: Text('Sign Up')),
         body: Padding(
           padding: const EdgeInsets.all(16.0),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               TextField(
                 controller: _emailController,
                 decoration: InputDecoration(labelText: 'Email'),
                 keyboardType: TextInputType.emailAddress,
               ),
               TextField(
                 controller: _passwordController,
                 decoration: InputDecoration(labelText: 'Password'),
                 obscureText: true,
               ),
               SizedBox(height: 20),
               ElevatedButton(
                 onPressed: () {
                   _signupController.createUserWithEmailAndPassword(
                     _emailController.text,
                     _passwordController.text,
                   );
                 },
                 child: Text('Sign Up'),
               ),
             ],
           ),
         ),
       );
     }
   }