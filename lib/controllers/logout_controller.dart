import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LogoutController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> logout() async {
    try {
      await _auth.signOut();
      Get.snackbar('Logout', 'Logout Berhasil', snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan saat logout', snackPosition: SnackPosition.BOTTOM);
    }
  }
}
