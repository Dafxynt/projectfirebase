import 'package:get/get.dart';
import '../screens/login_screen.dart';
import '../screens/absen_screen.dart';
import '../screens/home_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/welcome_screen.dart';
import '../binding/signup_binding.dart';
import '../binding/login_binding.dart';
import '../screens/profile_screen.dart';
import '../binding/logout_binding.dart';


class AppRoutes {
  static final routes = [
    GetPage(name: '/welcome', page: () => WelcomeScreen()),
    GetPage(name: '/login', page: () => LoginScreen(), binding: LoginBinding()),
    GetPage(name: '/home', page: () => HomeScreen()),
    GetPage(name: '/absen', page: () => AbsenScreen()),
    GetPage(name: '/signup', page: () => SignupScreen(), binding: SignupBinding()),
    GetPage(name: '/profile', page: () => ProfileScreen(), binding: LogoutBinding()), // Menambahkan route untuk ProfileScreen
  ];
}

