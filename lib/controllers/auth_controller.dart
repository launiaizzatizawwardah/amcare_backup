import 'package:get/get.dart';

class AuthController extends GetxController {
  // RxBool untuk reactive
  var isLoggedIn = false.obs;

  // Simulasi login/logout
  void login() {
    isLoggedIn.value = true;
  }

  void logout() {
    isLoggedIn.value = false;
  }
}
