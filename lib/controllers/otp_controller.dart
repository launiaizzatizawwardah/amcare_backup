import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '/routes/app_routes.dart';

class OtpController extends GetxController {
  var isLoading = false.obs;
  var isResending = false.obs;

  // 🔗 Ganti IP kalau perlu
  final baseUrl = 'http://172.16.24.137:8080/api';

  /// 🔹 KIRIM OTP
  Future<void> sendOtp(String nik) async {
    try {
      isLoading.value = true;
      final url = Uri.parse('$baseUrl/otp');
      print('📤 Kirim OTP ke: $url');

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'nik': nik}), // ⬅️ required body
      );

      print('📥 Status: ${response.statusCode}');
      print('📦 Body: ${response.body}');

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['status'] == 'success') {
        Get.snackbar("Berhasil", "Kode OTP dikirim ke nomor WA terdaftar");
        // simpan nik supaya bisa dipakai nanti di verify
        Get.toNamed(AppRoutes.otpVerification, arguments: {'nik': nik});
      } else {
        Get.snackbar("Gagal", data['message'] ?? "Gagal mengirim OTP");
      }
    } catch (e) {
      Get.snackbar("Error", "Terjadi kesalahan: $e");
    } finally {
      isLoading.value = false;
    }
  }

  /// 🔹 VERIFIKASI OTP
  Future<void> verifyOtp({
    required String nik,
    required String otp,
    required String uuid,
    required String ipaddress,
  }) async {
    if (otp.isEmpty || otp.length != 6) {
      Get.snackbar("Error", "Masukkan 6 digit kode OTP yang valid");
      return;
    }

    try {
      isLoading.value = true;
      final url = Uri.parse('$baseUrl/verify-otp');
      print('📤 Verifikasi OTP ke: $url');

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'nik': nik,
          'otp': otp,
          'uuid': uuid,
          'ipaddress': ipaddress,
        }),
      );

      print('📥 Status: ${response.statusCode}');
      print('📦 Body: ${response.body}');

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['status'] == 'success') {
        Get.snackbar("Sukses", "OTP berhasil diverifikasi!");
        Get.offAllNamed(AppRoutes.home1);
      } else {
        Get.snackbar("Gagal", data['message'] ?? "OTP salah atau kedaluwarsa");
      }
    } catch (e) {
      Get.snackbar("Error", "Terjadi kesalahan: $e");
    } finally {
      isLoading.value = false;
    }
  }

  /// 🔹 KIRIM ULANG OTP
  Future<void> resendOtp(String nik) async {
    try {
      isResending.value = true;
      final url = Uri.parse('$baseUrl/otp');
      print('📤 Kirim ulang OTP ke: $url');

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'nik': nik}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['status'] == 'success') {
        Get.snackbar("Sukses", "Kode OTP dikirim ulang ke nomor WA");
      } else {
        Get.snackbar("Gagal", data['message'] ?? "Gagal mengirim ulang OTP");
      }
    } catch (e) {
      Get.snackbar("Error", "Terjadi kesalahan: $e");
    } finally {
      isResending.value = false;
    }
  }
}
