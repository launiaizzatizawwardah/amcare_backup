import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/controllers/poliklinik_controller.dart';
import '/routes/app_routes.dart';
import '/models/poliklinik_model.dart';

class JadwalDokterPage extends StatelessWidget {
  final PoliklinikController controller = Get.put(PoliklinikController());

  JadwalDokterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ⭐ Ambil nama poliklinik dari halaman sebelumnya
    final String? selectedPoli = Get.arguments;

    // ⭐ Jalankan filter awal berdasarkan poliklinik
    if (selectedPoli != null) {
      Future.microtask(() {
        controller.filterByKlinik(selectedPoli);
      });
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // 🔹 background marble
          Positioned.fill(
            child: Image.asset(
              'assets/images/background-marble.png',
              fit: BoxFit.cover,
            ),
          ),

          // 🔹 header melengkung
          Container(
            height: 150,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF2E8BC0),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Get.offAllNamed(AppRoutes.home1),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Jadwal Dokter",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'LexendExa',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
          ),

          // 🔹 konten utama
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 160, 16, 0),
            child: Column(
              children: [
                // ⭐ Search bar (masih tetap bisa cari manual)
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari Dokter atau Poliklinik',
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: controller.searchPoliklinik,
                ),

                const SizedBox(height: 16),

                // LIST DOKTER
                Expanded(
                  child: Obx(() {
                    final list = controller.filteredList;

                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(bottom: 20),
                      itemCount: list.length,
                      itemBuilder: (_, index) {
                        final item = list[index];

                        return Container(
                          margin: const EdgeInsets.only(bottom: 18),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.95),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 6,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // info dokter
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.namaPoli,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF2E8BC0),
                                          fontSize: 15,
                                          fontFamily: 'LexendExa',
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        item.namaDokter,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87,
                                          fontSize: 13,
                                          fontFamily: 'LexendExa',
                                        ),
                                      ),
                                    ],
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Get.toNamed(AppRoutes.pendaftaranOnline);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF2E8BC0),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14, vertical: 6),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: const Text(
                                      'Reservasi',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        fontFamily: 'LexendExa',
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 14),

                              // jadwal
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 10),
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xFF2E8BC0).withOpacity(0.08),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: item.jadwal.keys.map((hari) {
                                    final jamList = item.jadwal[hari] ?? ['-'];
                                    final jam = jamList.join('\n');

                                    return Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 6),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: Colors.blueAccent
                                                .withOpacity(0.2),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Text(
                                              hari,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF2E8BC0),
                                                fontSize: 12,
                                                fontFamily: 'LexendExa',
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              jam,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontSize: 11,
                                                color: Colors.black54,
                                                fontFamily: 'LexendExa',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
