import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'SearchPage.dart';
import 'OrderPage.dart';
import 'Favorite.dart';

// import 'Login.dart'; // Aktifkan ini jika file Login.dart Anda sudah siap

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final Color _primaryGreen = const Color(0xFF38683A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: Stack(
        children: [
          // --- 1. KONTEN UTAMA ---
          SingleChildScrollView(
            padding: const EdgeInsets.only(
              bottom: 120,
            ), // Jarak aman untuk Bottom Nav
            child: Column(
              children: [
                // --- HEADER PROFIL (HIJAU) ---
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    top: 70,
                    bottom:
                        60, // Padding bawah lebih besar untuk ruang kartu melayang
                    left: 24,
                    right: 24,
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
                      // Foto Profil dengan border putih
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2.5),
                          image: const DecorationImage(
                            image: NetworkImage(
                              'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=crop&w=150&q=80',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),

                      // Teks Identitas
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'EDWARD',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 0.5,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'edward@gmail.com',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.85),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Badge Member
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                'Eco-Member Gold',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Tombol Edit Profil
                      IconButton(
                        icon: const Icon(
                          Icons.edit_square,
                          color: Colors.white,
                          size: 22,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),

                // --- KARTU STATISTIK ECO (Melayang menimpa header) ---
                Transform.translate(
                  offset: const Offset(0, -35),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildEcoStat(
                          '12',
                          'Plastik\nDitolak',
                          Icons.block,
                          Colors.red.shade400,
                        ),
                        Container(
                          width: 1,
                          height: 40,
                          color: Colors.grey.shade200,
                        ),
                        _buildEcoStat(
                          '5',
                          'Wadah\nDikembalikan',
                          Icons.recycling,
                          _primaryGreen,
                        ),
                        Container(
                          width: 1,
                          height: 40,
                          color: Colors.grey.shade200,
                        ),
                        _buildEcoStat(
                          '450',
                          'Poin Eco\nTerkumpul',
                          Icons.stars,
                          Colors.amber.shade600,
                        ),
                      ],
                    ),
                  ),
                ),

                // --- MENU LIST ---
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Kategori: Aktivitas 3R
                      const Text(
                        'Aktivitas 3R & Pesanan',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildMenuGroup([
                        _buildMenuItem(
                          Icons.receipt_long,
                          'Riwayat Pesanan',
                          true,
                        ),
                        _buildMenuItem(
                          Icons.compost,
                          'Voucher Upcycle & Promo',
                          true,
                        ),
                        _buildMenuItem(
                          Icons.sync_alt,
                          'Jadwal Jemput Wadah',
                          false,
                        ),
                      ]),

                      const SizedBox(height: 25),

                      // Kategori: Pengaturan Akun
                      const Text(
                        'Pengaturan Akun',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildMenuGroup([
                        _buildMenuItem(
                          Icons.location_on_outlined,
                          'Alamat Tersimpan',
                          true,
                        ),
                        _buildMenuItem(
                          Icons.credit_card_outlined,
                          'Metode Pembayaran',
                          true,
                        ),
                        _buildMenuItem(
                          Icons.notifications_outlined,
                          'Notifikasi',
                          false,
                        ),
                      ]),

                      const SizedBox(height: 25),

                      // Kategori: Bantuan
                      _buildMenuGroup([
                        _buildMenuItem(
                          Icons.help_outline,
                          'Pusat Bantuan',
                          true,
                        ),
                        _buildMenuItem(
                          Icons.info_outline,
                          'Tentang Nest Food (3R)',
                          false,
                        ),
                      ]),

                      const SizedBox(height: 35),

                      // Tombol Keluar (Logout)
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () {
                            // Aksi Logout: Kembali ke halaman Login (jika ada)
                            // Navigator.pushAndRemoveUntil(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => const LoginPage()),
                            //   (route) => false,
                            // );
                          },
                          icon: Icon(
                            Icons.logout,
                            color: Colors.red.shade400,
                            size: 20,
                          ),
                          label: Text(
                            'Keluar',
                            style: TextStyle(
                              color: Colors.red.shade400,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            side: BorderSide(
                              color: Colors.red.shade200,
                              width: 1.5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            backgroundColor:
                                Colors.red.shade50, // Latar merah sangat pudar
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // --- 2. BOTTOM NAVIGATION BAR MENGAMBANG (KONSISTEN) ---
          Positioned(
            bottom: 30, // Posisi persis sama dengan halaman lain
            left: 20,
            right: 20,
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBottomNavItem(
                    context,
                    Icons.home_outlined,
                    'Home',
                    false,
                    0,
                  ),
                  _buildBottomNavItem(
                    context,
                    Icons.search_outlined,
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
                    Icons.favorite_border,
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
                  ), // Index 4 Aktif (Menyala)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // WIDGET KUSTOM: Info Statistik Eco (Dalam Kartu Melayang)
  Widget _buildEcoStat(String value, String label, IconData icon, Color color) {
    return Column(
      children: [
        Icon(icon, color: color, size: 22),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  // WIDGET KUSTOM: Wadah Kotak Putih untuk Grup Menu
  Widget _buildMenuGroup(List<Widget> items) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(children: items),
    );
  }

  // WIDGET KUSTOM: Baris Menu Individual
  Widget _buildMenuItem(IconData icon, String title, bool showDivider) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                // Kotak Ikon
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF0F7F0), // Hijau sangat pudar
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: _primaryGreen, size: 20),
                ),
                const SizedBox(width: 15),
                // Judul
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
                // Panah Kanan
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Colors.grey.shade400,
                ),
              ],
            ),
          ),
        ),
        if (showDivider)
          Padding(
            padding: const EdgeInsets.only(left: 55, right: 16),
            child: Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey.shade100,
            ),
          ),
      ],
    );
  }

  // WIDGET NAVIGASI UNIVERSAL (Konsisten)
  Widget _buildBottomNavItem(
    BuildContext context,
    IconData icon,
    String label,
    bool isSelected,
    int index,
  ) {
    return GestureDetector(
      onTap: () {
        if (isSelected) return;

        Widget nextScreen;
        switch (index) {
          case 0:
            nextScreen = const HomePage();
            break;
          case 1:
            nextScreen = const SearchPage();
            break;
          case 2:
            nextScreen = const OrderPage();
            break;
          case 3:
            nextScreen = const FavoritePage();
            break;
          case 4:
            return; // Sudah di halaman Account
          default:
            return;
        }

        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => nextScreen,
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
      },
      child: Container(
        color: Colors.transparent,
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
