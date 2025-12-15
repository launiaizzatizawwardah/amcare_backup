import 'package:get/get.dart';
import '../models/poliklinik_model.dart';

class PoliklinikController extends GetxController {
  // List utama (dummy)
  final listPoliklinik = <Poliklinik>[
    Poliklinik(
      namaPoli: 'Poli Umum',
      namaDokter: 'dr. Syahrizal',
      jadwal: {
        'Senin': ['08:00', '10:00'],
        'Selasa': ['09:00', '11:00']
      },
    ),
    Poliklinik(
      namaPoli: 'Poli Anak',
      namaDokter: 'dr. Anita',
      jadwal: {
        'Senin': ['08:00'],
        'Rabu': ['09:00']
      },
    ),
    Poliklinik(
      namaPoli: 'Poli Gigi',
      namaDokter: 'drg. Rina',
      jadwal: {
        'Kamis': ['10:00'],
        'Jumat': ['12:00']
      },
    ),
  ].obs;

  // List yang akan ditampilkan
  var filteredList = <Poliklinik>[].obs;

  @override
  void onInit() {
    super.onInit();
    filteredList.assignAll(listPoliklinik);
  }

  // Search bar
  void searchPoliklinik(String query) {
    if (query.isEmpty) {
      filteredList.assignAll(listPoliklinik);
      return;
    }
    filteredList.assignAll(listPoliklinik.where((p) =>
        p.namaPoli.toLowerCase().contains(query.toLowerCase()) ||
        p.namaDokter.toLowerCase().contains(query.toLowerCase())));
  }

  // 🔥 FILTER DARI HALAMAN POLIKLINIK (klik klinik)
  void filterByKlinik(String klinik) {
    klinik = klinik.toLowerCase().replaceAll("klinik ", "");

    filteredList.assignAll(
      listPoliklinik.where((p) =>
          p.namaPoli.toLowerCase().contains(klinik) ||
          p.namaPoli.toLowerCase().replaceAll("poli ", "").contains(klinik)),
    );
  }
}
