import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'OrderPage.dart';
import 'AccountPage.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final Color _primaryGreen = const Color(0xFF38683A);

  // State untuk filter kategori aktif
  int _selectedCategoryIndex = 0;
  final List<String> _categories = [
    'Semua',
    'Refuse (Minim Plastik)',
    'Recycle (Wadah Reusable)',
    'Upcycle',
  ];

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
            ), // Jarak aman agar konten bawah tidak tertutup nav bar
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- HEADER HIJAU EKSKLUSIF ---
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
                        'UMKM Favoritmu',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Pahlawan Bumi! Pilihan makananmu sangat membantu mengurangi sampah lingkungan. 🌱',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 13,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // --- FILTER KATEGORI 3R ---
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: List.generate(
                      _categories.length,
                      (index) => _buildCategoryChip(index, _categories[index]),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // --- DAFTAR KARTU FAVORIT ---
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      _buildFavoriteCard(
                        name: 'Bakso ojo lali',
                        tag: 'Recycle (Wadah Reusable)',
                        tagIcon: Icons.recycling,
                        rating: '4.7',
                        distance: '2.3 KM',
                        imagePath: 'Asset/Image/BaksoBiasa.png', // Aset Lokal
                      ),
                      const SizedBox(height: 16),
                      _buildFavoriteCard(
                        name: 'Sate ayam bang jamal',
                        tag: 'Refuse (Tanpa Plastik)',
                        tagIcon: Icons.block,
                        rating: '4.6',
                        distance: '4.3 KM',
                        imagePath: 'Asset/Image/Sate.png', // Aset Lokal
                      ),
                      const SizedBox(height: 16),
                      _buildFavoriteCard(
                        name: 'Seblak Harkit',
                        tag: 'Upcycle (Ampas Organik)',
                        tagIcon: Icons.compost,
                        rating: '4.8',
                        distance: '5.3 KM',
                        imagePath: 'Asset/Image/Seblak.png', // Aset Lokal
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // --- 2. BOTTOM NAVIGATION BAR MENGAMBANG (UKURAN 100% KONSISTEN ALA IOS) ---
          Positioned(
            bottom: 15, // Disamakan persis dengan halaman lain
            left: 20,
            right: 20,
            child: Container(
              height: 70, // Disamakan tinggi kapsulnya
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  40,
                ), // Bulat penuh (pill-shaped)
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(
                      0,
                      10,
                    ), // Bayangan jatuh ke bawah ala iOS
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
                    Icons.favorite,
                    'Favorite',
                    true,
                    3,
                  ), // Index 3 Aktif
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

  // WIDGET KUSTOM: Chip Kategori 3R
  Widget _buildCategoryChip(int index, String title) {
    bool isSelected = _selectedCategoryIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategoryIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? _primaryGreen : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? _primaryGreen : Colors.grey.shade300,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: _primaryGreen.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ]
              : [],
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey.shade600,
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
          ),
        ),
      ),
    );
  }

  // WIDGET KUSTOM: Kartu UMKM Favorit
  Widget _buildFavoriteCard({
    required String name,
    required String tag,
    required IconData tagIcon,
    required String rating,
    required String distance,
    required String imagePath,
  }) {
    bool isNetworkImage = imagePath.startsWith('http');

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18),
                  bottomLeft: Radius.circular(18),
                ),
                child: isNetworkImage
                    ? Image.network(
                        imagePath,
                        width: 110,
                        height: 120,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        imagePath,
                        width: 110,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0F7F0),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: const Color(0xFFC7DCC9)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(tagIcon, color: _primaryGreen, size: 12),
                            const SizedBox(width: 4),
                            Text(
                              tag,
                              style: TextStyle(
                                color: _primaryGreen,
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.black87,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            rating,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Icon(
                            Icons.circle,
                            color: Colors.grey.shade400,
                            size: 6,
                          ),
                          const SizedBox(width: 10),
                          Icon(
                            Icons.location_on,
                            color: Colors.grey.shade400,
                            size: 14,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            distance,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 40),
            ],
          ),

          Positioned(
            top: 5,
            right: 5,
            child: IconButton(
              icon: Icon(Icons.favorite, color: Colors.red.shade400, size: 24),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Dihapus dari favorit'),
                    duration: const Duration(seconds: 1),
                    backgroundColor: _primaryGreen,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // WIDGET NAVIGASI UNIVERSAL
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
            return; // Halaman Search
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
            const SizedBox(height: 1),
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
