import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/controllers/otp_controller.dart';
import '/routes/app_routes.dart';

class OTPVerificationPage extends StatelessWidget {
  OTPVerificationPage({super.key});

  final otpC = Get.find<OtpController>();
  final otpControllers = List.generate(6, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    // Ambil NIK dari halaman Login
    final args = Get.arguments;
    final String nik = (args?['nik'] ?? '').toString();

    return Scaffold(
      appBar: AppBar(title: const Text("Verifikasi OTP"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Text(
              "Masukkan kode OTP yang dikirim ke WhatsApp kamu",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 10),
            Text(
              nik,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

            // 6 digit OTP boxes
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(6, (index) {
                return SizedBox(
                  width: 45,
                  height: 55,
                  child: TextField(
                    controller: otpControllers[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 5) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                );
              }),
            ),

            const SizedBox(height: 50),

            // Tombol Verifikasi tanpa API
            ElevatedButton(
              onPressed: () {
                final otp = otpControllers.map((c) => c.text).join();

                if (otp.length != 6) {
                  Get.snackbar(
                    "OTP Tidak Lengkap",
                    "Masukkan 6 digit OTP",
                    backgroundColor: Colors.orange.shade100,
                    colorText: Colors.black87,
                  );
                  return;
                }

                if (otp == "123456") {
                  // OTP benar → ke Homepage1
                  Get.offAllNamed(AppRoutes.home1);
                } else {
                  Get.snackbar(
                    "OTP Salah",
                    "Kode OTP yang kamu masukkan salah!",
                    backgroundColor: Colors.red.shade100,
                    colorText: Colors.red.shade900,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 80, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: Colors.blueAccent,
              ),
              child: const Text(
                "Verifikasi",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),

            const SizedBox(height: 20),

            // Tombol kirim ulang dummy
            TextButton(
              onPressed: () {
                Get.snackbar(
                  "OTP Dikirim Ulang",
                  "Gunakan kode dummy: 123456",
                  backgroundColor: Colors.blue.shade50,
                  colorText: Colors.blue.shade900,
                );
              },
              child: const Text("Kirim Ulang OTP"),
            ),
          ],
        ),
      ),
    );
  }
}
