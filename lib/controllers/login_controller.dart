import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var isLoading = false.obs;

  // Metode untuk login menggunakan email dan password
  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      // Menetapkan status loading menjadi true
      isLoading.value = true;

      // Mencoba melakukan sign in menggunakan Firebase Authentication
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Jika berhasil, kita arahkan ke halaman home dan mengembalikan true
      Get.offAllNamed('/home');
      return true;
    } catch (e) {
      // Menangani error jika login gagal
      print('Login failed: $e');
      return false;  // Mengembalikan false jika login gagal
    } finally {
      // Mengubah status loading menjadi false setelah proses selesai
      isLoading.value = false;
    }
  }
}
