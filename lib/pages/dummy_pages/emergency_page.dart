import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/routes/app_routes.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // 🔹 Background marble
          Positioned.fill(
            child: Image.asset(
              'assets/images/background-marble.png',
              fit: BoxFit.cover,
            ),
          ),

          Column(
            children: [
              // 🔹 Header Biru
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

                        // ⭐ TOMBOL BACK KE HOMEPAGE1
                        onPressed: () => Get.offAllNamed(AppRoutes.home1),
                      ),

                      const Expanded(
                        child: Center(
                          child: Text(
                            "Emergency",
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

              const SizedBox(height: 20),

              // 🔹 Konten Utama
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      _buildContactCard(
                        icon: Icons.local_phone,
                        title: 'Emergency Call',
                        number: '(0274) 618224',
                      ),
                      _buildContactCard(
                        icon: Icons.call,
                        title: 'Call Center',
                        number: '(0274) 618400',
                      ),
                      _buildContactCard(
                        icon: Icons.chat,
                        title: 'WhatsApp',
                        number: '+62 817 0618 400',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // 🔹 COMPONENT CARD KONTAK
  // ============================================================
  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String number,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blueAccent.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF2E8BC0).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blueAccent.withOpacity(0.2)),
            ),
            child: Icon(icon, color: const Color(0xFF2E8BC0), size: 26),
          ),
          const SizedBox(width: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF2E8BC0),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'LexendExa',
                ),
              ),
              const SizedBox(height: 4),
              Text(
                number,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                  fontFamily: 'LexendExa',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
