// File: ./widget/service_card.dart (Revisi Akhir untuk Tinggi)

import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String? imageUrl;

  const ServiceCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    this.imageUrl,
  });

  String _cleanHtmlTags(String text) {
    return text.replaceAll(RegExp(r'<[^>]*>'), '').trim();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Bagian Gambar Layanan
          if (imageUrl != null && imageUrl!.isNotEmpty)
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                imageUrl!,
                height: 80, // Tinggi gambar dikunci
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 80,
                  color: Colors.grey.shade200,
                  child: const Center(
                    child:
                        Icon(Icons.broken_image, color: Colors.grey, size: 30),
                  ),
                ),
              ),
            ),

          // 🔹 Bagian Konten Teks dan Harga
          Expanded(
            // ⭐ Gunakan Expanded di sini agar sisa ruang dihabiskan
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Distribusi ruang vertikal
                children: [
                  // Judul & Subtitle
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          height: 1.2,
                        ),
                        maxLines: 1, // Judul 1 baris
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _cleanHtmlTags(subtitle),
                        style: const TextStyle(
                          fontSize: 10,
                          height: 1.2,
                          color: Colors.black54,
                        ),
                        maxLines: 2, // Subtitle 2 baris
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),

                  // Harga
                  Text(
                    price == '0' ? 'Gratis' : 'Rp $price',
                    style: TextStyle(
                      color: Colors.blue.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
