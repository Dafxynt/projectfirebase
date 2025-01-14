import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.offAllNamed('/home');
    } catch (e) {
      print('Error: $e');
    }
  }
}
