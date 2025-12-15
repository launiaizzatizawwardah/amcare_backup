import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/controllers/pendaftaran_controller.dart';
import '/routes/app_routes.dart';

class PendaftaranOnlinePage extends StatelessWidget {
  const PendaftaranOnlinePage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(PendaftaranController());
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: const Color(0xFF2E8BC0),
        foregroundColor: Colors.white,
        elevation: 0,

        title: const Text(
          'Pendaftaran Online',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        // ⭐ TOMBOL BACK KE HOMEPAGE1
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.offAllNamed(AppRoutes.home1),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // 🔹 Logo
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/logo_rs.png',
                        height: screenWidth < 400 ? 60 : 80,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'RS AMC MUHAMMADIYAH',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),

                // 🔹 Pasien
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Pasien (Nama & RM)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  value: c.selectedPasien.value.isEmpty
                      ? null
                      : c.selectedPasien.value,
                  items: c.pasienList
                      .map(
                        (p) => DropdownMenuItem(
                          value: '${p['nama']} (${p['rm']})',
                          child: Text('${p['nama']} (${p['rm']})'),
                        ),
                      )
                      .toList(),
                  onChanged: (val) => c.selectedPasien.value = val ?? '',
                ),

                const SizedBox(height: 20),

                // 🔹 Tanggal
                TextField(
                  readOnly: true,
                  onTap: () => c.pilihTanggal(context),
                  decoration: InputDecoration(
                    labelText: 'Tanggal Periksa',
                    hintText: c.tanggal.value == null
                        ? 'Pilih tanggal'
                        : '${c.tanggal.value!.day}/${c.tanggal.value!.month}/${c.tanggal.value!.year}',
                    suffixIcon: const Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // 🔹 Poli
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Pilih Poli',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  value: c.poliList.contains(c.poli.value) ? c.poli.value : null,
                  items: c.poliList
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ),
                      )
                      .toList(),
                  onChanged: (val) {
                    c.poli.value = val ?? '';
                    c.dokter.value = '';
                    c.kuota.value = 0;
                  },
                ),

                const SizedBox(height: 20),

                // 🔹 Dokter
                DropdownButtonFormField<String>(
                  key: ValueKey(c.poli.value),
                  decoration: InputDecoration(
                    labelText: 'Pilih Dokter (Nama & Jam)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  value: c.dokterList
                          .map((d) => '${d['nama']} (${d['jam']})')
                          .contains(c.dokter.value)
                      ? c.dokter.value
                      : null,
                  items: c.dokterList
                      .map(
                        (d) => DropdownMenuItem(
                          value: '${d['nama']} (${d['jam']})',
                          child: Text('${d['nama']} (${d['jam']})'),
                        ),
                      )
                      .toList(),
                  onChanged: (val) {
                    if (val == null) {
                      c.dokter.value = '';
                      c.kuota.value = 0;
                      return;
                    }

                    final dokterData = c.dokterMap[c.poli.value]?.firstWhere(
                      (d) => '${d['nama']} (${d['jam']})' == val,
                      orElse: () => {'kuota': 0},
                    );

                    c.dokter.value = val;
                    c.kuota.value = (dokterData?['kuota'] ?? 0) as int;
                  },
                ),

                const SizedBox(height: 20),

                // 🔹 Kuota
                if (c.dokter.value.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.all(14),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: c.kuota.value > 0
                          ? const Color(0xFFE3F2FD)
                          : const Color(0xFFFFEBEE),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: c.kuota.value > 0
                            ? const Color(0xFF2E8BC0)
                            : Colors.redAccent,
                      ),
                    ),
                    child: Text(
                      c.kuota.value > 0
                          ? 'Sisa Kuota Dokter: ${c.kuota.value}'
                          : 'Kuota Dokter Penuh',
                      style: TextStyle(
                        color: c.kuota.value > 0
                            ? const Color(0xFF2E8BC0)
                            : Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                const SizedBox(height: 30),

                // 🔹 Tombol Continue
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: (c.dokter.value.isNotEmpty &&
                            c.kuota.value > 0)
                        ? () => c.submitForm(context)
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2E8BC0),
                      disabledBackgroundColor:
                          const Color(0xFF2E8BC0).withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
