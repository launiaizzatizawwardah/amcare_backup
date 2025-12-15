import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_routes.dart';

// 🧠 Controller
import 'controllers/auth_controller.dart';
import 'controllers/otp_controller.dart';
import 'controllers/main_controller.dart'; // ⭐ controller bottom nav

void main() {
  // Controller global
  Get.put(AuthController());
  Get.put(OtpController());
  Get.put(MainController()); // ⭐ WAJIB agar bottom nav tetap hidup

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RS AMC',
      initialRoute: AppRoutes.splash, // tetap sama
      getPages: AppRoutes.routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
