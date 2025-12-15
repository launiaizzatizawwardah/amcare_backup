import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';
import 'dart:async';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.offNamed(AppRoutes.home); // Navigasi ke HomePage
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: Column(
              children: [
                // 🏥 Logo lokal dari assets
                Image.asset(
                  'assets/images/logo_rs.png',
                  width: 140,
                  height: 140,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 12),

                const Text(
                  'AMCare',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          const Text(
            'V 1.1',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            'Powered by IT RS AMC Muhammadiyah',
            style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
