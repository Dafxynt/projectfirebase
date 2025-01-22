// lib/main.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:permission_handler/permission_handler.dart'; // Import permission_handler
import 'route/route.dart';
import 'service/notifservice.dart'; // Add import for NotificationService

void requestNotificationPermission() async {
  var status = await Permission.notification.status;
  if (status.isDenied) {
    await Permission.notification.request();
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Inisialisasi untuk Sqflite
  await Firebase.initializeApp(); // Initialize Firebase
  await NotificationService.initialize(); // Initialize NotificationService
 feat/push_notification
  await NotificationService.getToken(); // Get FCM token
  requestNotificationPermission(); // Request notification permission

  WidgetsFlutterBinding.ensureInitialized(); // Inisialisasi untuk Sqflite

 main
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