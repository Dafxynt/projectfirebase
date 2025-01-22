// lib/main.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:permission_handler/permission_handler.dart'; // Import permission_handler
import 'route/route.dart';
import 'service/notifservice.dart'; // Add import for NotificationService

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  await NotificationService.initialize(); // Initialize NotificationService
  WidgetsFlutterBinding.ensureInitialized(); // Inisialisasi untuk Sqflite

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Firebase Auth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/welcome', // Initial route, make sure it's defined in your routes
      getPages: AppRoutes.routes, // Define your routes in AppRoutes
    );
  }
}
