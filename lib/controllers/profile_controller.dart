import 'package:get/get.dart';

class ProfileController extends GetxController {
  // LIST PASIEN
  final pasienList = [
    {"nama": "Launia Izzati Zawwardah", "rm": "098645", "username": "launia", "wa": "082246704458"},
    {"nama": "Launia Izzati", "rm": "221144", "username": "izzati", "wa": "08123456789"},
    {"nama": "Izzati Zawwardah", "rm": "556677", "username": "zawwa", "wa": "087712345678"},
  ].obs;

  // DATA YANG AKTIF
  RxString nama = "".obs;
  RxString rm = "".obs;
  RxString username = "".obs;
  RxString wa = "".obs;

  @override
  void onInit() {
    setPasien(0); // default pasien pertama
    super.onInit();
  }

  // GANTI PASIEN
  void setPasien(int index) {
    nama.value = pasienList[index]["nama"]!;
    rm.value = pasienList[index]["rm"]!;
    username.value = pasienList[index]["username"]!;
    wa.value = pasienList[index]["wa"]!;
  }
}
