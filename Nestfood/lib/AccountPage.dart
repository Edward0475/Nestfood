import 'package:flutter/material.dart';
import 'HomePage.dart'; // Menghubungkan ke Beranda
import 'Login.dart'; // Menghubungkan ke Halaman Login

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  // Warna hijau utama Nest Food
  final Color _primaryGreen = const Color(0xFF38683A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFF9FAFB,
      ), // Latar belakang abu-abu sangat muda
      body: Stack(
        children: [
          // --- 1. AREA KONTEN (Bisa di-scroll) ---
          SingleChildScrollView(
            // Padding bawah ditambahkan agar konten paling bawah
            // tidak tertutup oleh navigasi melayang
            padding: const EdgeInsets.only(bottom: 130),
            child: Column(
              children: [
                // Header Profil Hijau
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    top: 70, // Menghindari status bar (jam/baterai)
                    bottom: 40,
                    left: 30,
                    right: 30,
                  ),
                  decoration: BoxDecoration(
                    color: _primaryGreen,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Row(
                    children: [
                      // Foto Profil
                      Container(
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF9F6E8), // Warna krem estetik
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 20),

                      // Teks Identitas
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'EDWARD',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'EDWARD@GMAIL.COM',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 35),

                // Kartu Daftar Menu Profil
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.grey.shade200,
                        width: 1.2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _buildMenuItem(
                          Icons.receipt_long_outlined,
                          'Pesanan Saya',
                          true,
                        ),
                        _buildMenuItem(
                          Icons.location_on_outlined,
                          'Alamat Saya',
                          true,
                        ),
                        _buildMenuItem(
                          Icons.credit_card_outlined,
                          'Metode pembayaran',
                          true,
                        ),
                        _buildMenuItem(
                          Icons.settings_outlined,
                          'Pengaturan',
                          true,
                        ),
                        _buildMenuItem(
                          Icons.help_outline,
                          'Pusat bantuan',
                          true,
                        ),
                        _buildMenuItem(
                          Icons.info_outline,
                          'Tentang Nestfood',
                          false,
                        ),
                      ],
                    ),
                  ),
                ),

                // Jarak diperbesar agar tombol Keluar posisinya semakin "turun"
                const SizedBox(height: 80),

                // Tombol Keluar (Logout)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Menghapus riwayat layar dan memaksa kembali ke Login
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                        (Route<dynamic> route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _primaryGreen,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          25,
                        ), // Ujung lebih membulat
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Keluar',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // --- 2. BOTTOM NAVIGATION BAR (FLOATING ALA IOS) ---
          Positioned(
            bottom:
                15, // Dibuat lebih kecil agar posisinya semakin turun ke bawah layar
            left: 20,
            right: 20,
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  40,
                ), // Kapsul membulat penuh
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10), // Bayangan jatuh ke bawah
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Navigasi Ikon
                  _buildBottomNavItem(context, Icons.home, 'Home', false, 0),
                  _buildBottomNavItem(
                    context,
                    Icons.search,
                    'Search',
                    false,
                    1,
                  ),
                  _buildBottomNavItem(
                    context,
                    Icons.receipt_long,
                    'Pesanan',
                    false,
                    2,
                  ),
                  _buildBottomNavItem(
                    context,
                    Icons.favorite,
                    'Favorite',
                    false,
                    3,
                  ),
                  _buildBottomNavItem(
                    context,
                    Icons.person,
                    'Account',
                    true,
                    4,
                  ), // Account (Aktif)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget Kustom: Baris Menu
  Widget _buildMenuItem(IconData icon, String title, bool showDivider) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 16.0,
            ),
            child: Row(
              children: [
                Icon(icon, color: _primaryGreen, size: 26),
                const SizedBox(width: 18),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (showDivider)
          Padding(
            padding: const EdgeInsets.only(left: 64, right: 20),
            child: Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey.shade200,
            ),
          ),
      ],
    );
  }

  // Widget Kustom: Navigasi Bawah
  Widget _buildBottomNavItem(
    BuildContext context,
    IconData icon,
    String label,
    bool isSelected,
    int index,
  ) {
    return GestureDetector(
      onTap: () {
        // Logika berpindah ke HomePage jika ikon Home ditekan
        if (index == 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        }
      },
      child: Container(
        color: Colors.transparent, // Area sentuh diperluas
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? _primaryGreen : Colors.grey.shade400,
              size: 26,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? _primaryGreen : Colors.grey.shade400,
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
