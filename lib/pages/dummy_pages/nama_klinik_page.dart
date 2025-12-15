import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/routes/app_routes.dart';

class NamaPoliklinikPage extends StatelessWidget {
  NamaPoliklinikPage({super.key});

  final List<String> klinikList = [
    'Klinik Gigi',
    'Klinik Anak',
    'Klinik Penyakit Dalam',
    'Klinik Umum',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background-marble.png',
              fit: BoxFit.cover,
            ),
          ),

          // Header
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
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Get.back(),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Nama Poliklinik",
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

          // List klinik
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 170, 16, 0),
            child: ListView.builder(
              itemCount: klinikList.length,
              itemBuilder: (_, index) {
                final klinik = klinikList[index];

                return GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      AppRoutes.jadwalDokter,
                      arguments: klinik.replaceAll("Klinik ", ""),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: Colors.blueAccent.withOpacity(0.3)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.local_hospital,
                                size: 22, color: Color(0xFF2E8BC0)),
                            const SizedBox(width: 12),
                            Text(
                              klinik,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'LexendExa',
                                color: Color(0xFF2E8BC0),
                              ),
                            ),
                          ],
                        ),
                        const Icon(Icons.arrow_forward_ios,
                            size: 16, color: Colors.black45),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
