import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'OrderPage.dart';
import 'Favorite.dart';
import 'AccountPage.dart';

// Tambahkan ini di atas HomePage.dart, AccountPage.dart, dll

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- HEADER PENCARIAN ---
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    top: 60,
                    bottom: 30,
                    left: 24,
                    right: 24,
                  ),
                  decoration: BoxDecoration(
                    color: _primaryGreen,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: _primaryGreen.withOpacity(0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Mau makan apa hari ini?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 15),
                      // Kolom Input Pencarian
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: TextField(
                          autofocus:
                              false, // Ubah ke true jika ingin keyboard otomatis muncul
                          style: const TextStyle(fontSize: 14),
                          decoration: InputDecoration(
                            hintText: 'Cari "Menu Bebas Plastik"...',
                            hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 14,
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            suffixIcon: Container(
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE5F2E6),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.tune,
                                color: _primaryGreen,
                                size: 18,
                              ), // Ikon Filter
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // --- PENCARIAN TERAKHIR (RECENT SEARCHES) ---
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Pencarian Terakhir',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            'Hapus',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.red.shade400,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          _buildSearchChip(
                            'Sate ayam bang jamal',
                            Icons.history,
                          ),
                          _buildSearchChip(
                            'Seblak kemasan reusable',
                            Icons.history,
                          ),
                          _buildSearchChip('Nasi Goreng', Icons.history),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 35),

                // --- KATEGORI 3R PILIHAN ---
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Kategori Eco-Friendly',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildCategoryBox(
                            'Refuse',
                            'Tanpa\nPlastik',
                            Icons.block,
                          ),
                          _buildCategoryBox(
                            'Recycle',
                            'Wadah\nKembali',
                            Icons.recycling,
                          ),
                          _buildCategoryBox(
                            'Upcycle',
                            'Bahan\nOrganik',
                            Icons.compost,
                          ),
                          _buildCategoryBox(
                            'Lokal',
                            'UMKM\nTerdekat',
                            Icons.storefront,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 35),

                // --- REKOMENDASI PENCARIAN (Kartu Makanan) ---
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Rekomendasi Untukmu',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 15),
                      // Menggunakan aset lokal agar tidak error 404
                      _buildRecommendationCard(
                        'Bakso ojo lali',
                        'Asset/Image/BaksoBiasa.png',
                        '4.7',
                        'Recycle',
                      ),
                      const SizedBox(height: 15),
                      _buildRecommendationCard(
                        'Sate ayam bang jamal',
                        'Asset/Image/Sate.png',
                        '4.6',
                        'Refuse',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // --- 2. BOTTOM NAVIGATION BAR MENGAMBANG (KONSISTEN) ---
          Positioned(
            bottom: 30, // Konsisten dengan halaman lain
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
                    Icons.search,
                    'Search',
                    true,
                    1,
                  ), // Index 1 Aktif (Menyala)
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
                    Icons.person_outline,
                    'Account',
                    false,
                    4,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // WIDGET KUSTOM: Chip Riwayat Pencarian
  Widget _buildSearchChip(String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: Colors.grey.shade500),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  // WIDGET KUSTOM: Kotak Kategori Cepat (Bentuk Persegi)
  Widget _buildCategoryBox(String title, String subtitle, IconData icon) {
    return Container(
      width: 75,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0xFFE5F2E6),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: _primaryGreen, size: 20),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 9,
              color: Colors.grey.shade500,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  // WIDGET KUSTOM: Kartu Rekomendasi Horizontal
  Widget _buildRecommendationCard(
    String name,
    String imagePath,
    String rating,
    String tag,
  ) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              width: 65,
              height: 65,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      rating,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F7F0),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: const Color(0xFFC7DCC9)),
                      ),
                      child: Text(
                        tag,
                        style: TextStyle(
                          color: _primaryGreen,
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey.shade400),
        ],
      ),
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
            nextScreen = const AccountPage();
            break;
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
