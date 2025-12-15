import 'package:get/get.dart';

// 🏠 Main Pages
import '../pages/home_page.dart';
import '../pages/dummy_pages/home_page1.dart';

// 🔐 Auth Pages
import '../pages/dummy_pages/login_page.dart';
import '../pages/dummy_pages/otp_verification_page.dart';

// 📄 Dummy / Menu Pages
import '../pages/dummy_pages/pendaftaran_online_page.dart';
import '../pages/dummy_pages/riwayat_rekam_medis_page.dart';
import '../pages/dummy_pages/pemantauan_antrian_page.dart';
import '../pages/dummy_pages/jadwal_dokter_page.dart';
import '../pages/dummy_pages/nama_klinik_page.dart';
import '../pages/dummy_pages/tempat_tidur_page.dart';
import '../pages/dummy_pages/detail_tempat_tidur_page.dart';
import '../pages/dummy_pages/antrian_farmasi_page.dart';
import '../pages/dummy_pages/emergency_page.dart';

// 🚀 Detail Jadwal Dokter
import '../pages/dummy_pages/detail_jadwal_page.dart';

// 🚀 Splash
import '../pages/splash_page.dart';

// 👤 PROFILE PAGE (tambahkan file page profilmu)
import '../pages/dummy_pages/profile_page.dart';
import '../pages/dummy_pages/edit_profile_page.dart';


class AppRoutes {
  // Splash
  static const splash = '/';

  // Auth
  static const login = '/login';
  static const otpVerification = '/otp_verification';

  // Home
  static const home = '/home'; // sebelum login
  static const home1 = '/home1'; // setelah login

  // Menu lainnya
  static const pendaftaranOnline = '/pendaftaran_online';
  static const riwayatRekamMedis = '/riwayat_rekam_medis';
  static const pemantauanAntrian = '/pemantauan_antrian';
  static const jadwalDokter = '/jadwal_dokter';
  static const detailJadwal = '/detail-jadwal';
  static const namaKlinik = '/nama_klinik';
  static const tempatTidur = '/tempat_tidur';
  static const detailTempatTidur = '/detail-tempat-tidur';
  static const antrianFarmasi = '/antrian_farmasi';
  static const emergency = '/emergency';
  // ⭐ Profil
static const profile = '/profile';
static const editProfile = '/edit_profile';




  // ⭐ Tambahan route AKUN / PROFIL
  

  // 🔗 Semua route terdaftar di sini
  static final routes = [
    // Splash
    GetPage(name: splash, page: () => const SplashPage()),

    // Auth
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: otpVerification, page: () => OTPVerificationPage()),

    // Home
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: home1, page: () => const HomePage1()),

    // Menu dummy
    GetPage(name: pendaftaranOnline, page: () => const PendaftaranOnlinePage()),
    GetPage(name: riwayatRekamMedis, page: () => const RiwayatRekamMedisPage()),
    GetPage(name: pemantauanAntrian, page: () => const PemantauanAntrianPage()),
    GetPage(name: jadwalDokter, page: () => JadwalDokterPage()),
    GetPage(name: detailJadwal, page: () => DetailJadwalPage()),
    GetPage(name: namaKlinik, page: () => NamaPoliklinikPage()),
    GetPage(name: tempatTidur, page: () => TempatTidurPage()),
    GetPage(
      name: detailTempatTidur,
      page: () => const DetailTempatTidurPage(),
      transition: Transition.noTransition,
    ),
    GetPage(name: antrianFarmasi, page: () => const AntrianFarmasiPage()),
    GetPage(name: emergency, page: () => const EmergencyPage()),

    // ⭐ Route Profil
GetPage(name: profile, page: () => const ProfilePage()),
GetPage(name: editProfile, page: () => EditProfilePage()),



  ];
}
