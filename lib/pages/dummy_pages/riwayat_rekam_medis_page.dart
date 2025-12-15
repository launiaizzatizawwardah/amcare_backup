import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'riwayat_detail_page.dart';
import '../../models/rekam_medis_model.dart';
import '../../routes/app_routes.dart';

class RiwayatRekamMedisPage extends StatelessWidget {
  const RiwayatRekamMedisPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> riwayatList = [
      {
        'tanggal': '20 Nov 2025',
        'hari': '20',
        'poli': 'Poli Umum',
        'dokter': 'dr. Syahrizal Ardhiyandi Hidayat, MARS',
        'asuransi': 'Jasa Raharja',
      },
      {
        'tanggal': '15 Okt 2025',
        'hari': '15',
        'poli': 'Poli Gigi',
        'dokter': 'drg. Sinta Dewi',
        'asuransi': 'BPJS Kesehatan',
      },
      {
        'tanggal': '02 Sep 2025',
        'hari': '02',
        'poli': 'Poli Anak',
        'dokter': 'dr. Budi, SpA',
        'asuransi': 'Mandiri',
      },
      {
        'tanggal': '12 Agu 2025',
        'hari': '12',
        'poli': 'Poli Penyakit Dalam',
        'dokter': 'dr. Rina, SpPD',
        'asuransi': 'BPJS Kesehatan',
      },
    ];

    return Scaffold(
      extendBodyBehindAppBar:
          true, // ⭐ penting agar background masuk ke belakang AppBar
      backgroundColor: Colors.transparent,

      // ⭐ APPBAR
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(95),
        child: Container(
          height: 95,
          decoration: const BoxDecoration(
            color: Color(0xFF2E8BC0),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: SafeArea(
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back,
                      color: Colors.white, size: 26),
                  onPressed: () => Get.offAllNamed(AppRoutes.home1),
                ),
                const SizedBox(width: 4),
                const Text(
                  "Riwayat Rekam Medis",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'LexendExa',
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // ⭐ BODY
      body: Stack(
        children: [
          // ⭐ BACKGROUND MARBLE
          Positioned.fill(
            child: Image.asset(
              'assets/images/background-marble.png',
              fit: BoxFit.cover,
            ),
          ),

          // ⭐ KONTEN
          SingleChildScrollView(
            padding:
                const EdgeInsets.fromLTRB(16, 120, 16, 24), // naikkan konten
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // INFO PASIEN
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Column(
                        children: [
                          Text(
                            'Nomor Rekam Medis',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                              fontFamily: 'LexendExa',
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            '098645',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'LexendExa',
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Total Kunjungan',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                              fontFamily: 'LexendExa',
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            '4',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'LexendExa',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                for (var item in riwayatList) ...[
                  _buildRiwayatCard(item, riwayatList.indexOf(item)),
                  const SizedBox(height: 20),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ⭐ KARTU RIWAYAT
  Widget _buildRiwayatCard(Map<String, String> item, int index) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blueAccent.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tanggal
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item['hari']!,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'LexendExa',
                    ),
                  ),
                  Text(
                    item['tanggal']!,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.black54,
                      fontFamily: 'LexendExa',
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['poli']!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'LexendExa',
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  item['dokter']!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                    fontFamily: 'LexendExa',
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.verified_user,
                        color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    const Text(
                      'Asuransi',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black87,
                        fontFamily: 'LexendExa',
                      ),
                    ),
                    const SizedBox(width: 7),
                    Text(
                      item['asuransi']!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                        fontFamily: 'LexendExa',
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        showGeneralDialog(
                          context: Get.context!,
                          barrierDismissible: true,
                          barrierLabel: "Detail",
                          transitionDuration: const Duration(milliseconds: 280),
                          pageBuilder: (_, __, ___) {
                            return DetailRiwayatRekamMedis(
                              data: dummyRekamMedis[index],
                            );
                          },
                          transitionBuilder: (_, animation, __, child) {
                            return Transform.scale(
                              scale: animation.value,
                              child: Opacity(
                                opacity: animation.value,
                                child: child,
                              ),
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Detail',
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'LexendExa',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
