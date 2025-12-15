import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import '../../controllers/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      // ===================== APPBAR =====================
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E8BC0),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Profil",
          style: TextStyle(
            fontFamily: "LexendExa",
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),

      body: Obx(() {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // ===================== KARTU PROFIL TANPA BORDER =====================
              Container(
                padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),

                  // ❗ Border dihilangkan
                  border: Border.all(
                    color: Colors.transparent,
                    width: 0,
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundColor: Color(0xFF2E8BC0),
                      child: Icon(Icons.person, size: 48, color: Colors.white),
                    ),
                    const SizedBox(height: 12),

                    Text(
                      c.nama.value,
                      style: const TextStyle(
                        fontFamily: "LexendExa",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    Text(
                      c.rm.value,
                      style: const TextStyle(
                        fontFamily: "LexendExa",
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ===================== DROPDOWN PASIEN/RM =====================
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFF2E8BC0), width: 1.3),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: "${c.nama.value} (${c.rm.value})",
                    icon: const Icon(Icons.keyboard_arrow_down_rounded),
                    style: const TextStyle(
                      fontFamily: "LexendExa",
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    items: c.pasienList
                        .map((p) => "${p['nama']} (${p['rm']})")
                        .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            ))
                        .toList(),
                    onChanged: (value) {
                      final index = c.pasienList.indexWhere(
                        (p) => "${p['nama']} (${p['rm']})" == value,
                      );
                      c.setPasien(index);
                    },
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // ===================== USERNAME =====================
              _boxField(label: "Username", value: c.username.value),

              const SizedBox(height: 18),

              // ===================== NOMOR WA =====================
              _boxField(label: "Nomor WA", value: c.wa.value),

              const SizedBox(height: 35),

              // ===================== LOGOUT =====================
              TextButton(
                onPressed: () {
                  Get.dialog(
                    AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      title: const Text(
                        "Konfirmasi Logout",
                        style: TextStyle(
                          fontFamily: "LexendExa",
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      content: const Text(
                        "Apakah Anda yakin ingin keluar dari akun?",
                        style: TextStyle(
                          fontFamily: "LexendExa",
                          fontSize: 13,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Get.back(),
                          child: const Text(
                            "Batal",
                            style: TextStyle(
                              fontFamily: "LexendExa",
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2E8BC0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Get.back();
                            Get.offAllNamed(AppRoutes.home);
                          },
                          child: const Text(
                            "Ya, Log Out",
                            style: TextStyle(
                              fontFamily: "LexendExa",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text(
                  "Log Out",
                  style: TextStyle(
                    fontFamily: "LexendExa",
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        );
      }),
    );
  }

  // ===================== CUSTOM FIELD =====================
  Widget _boxField({required String label, required String value}) {
    return TextField(
      readOnly: true,
      controller: TextEditingController(text: value),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          fontFamily: "LexendExa",
          color: Color(0xFF2E8BC0),
        ),
        floatingLabelStyle: const TextStyle(
          color: Color(0xFF2E8BC0),
          fontFamily: "LexendExa",
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFF2E8BC0), width: 1.3),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFF2E8BC0), width: 1.7),
        ),
      ),
      style: const TextStyle(
        fontFamily: "LexendExa",
        fontSize: 14,
      ),
    );
  }
}
