import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'SearchPage.dart';
import 'OrderPage.dart';
import 'AccountPage.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final Color _primaryGreen = const Color(0xFF38683A);
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
      backgroundColor: const Color(0xFFF4F7F5), // Warna latar lebih sejuk
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- HEADER EKSKLUSIF ---
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    top: 65,
                    bottom: 35,
                    left: 24,
                    right: 24,
                  ),
                  decoration: BoxDecoration(
                    color: _primaryGreen,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'UMKM Favoritmu',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Pahlawan Bumi! Pilihan makananmu sangat membantu mengurangi sampah lingkungan. 🌱',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 13,
                          height: 1.4,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // --- FILTER KATEGORI (CHIPS) ---
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

                const SizedBox(height: 25),

                // --- DAFTAR KARTU FAVORIT ESTETIK ---
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      _buildAestheticFavoriteCard(
                        name: 'Bakso ojo lali',
                        tag: 'Recycle (Wadah Reusable)',
                        tagIcon: Icons.recycling,
                        rating: '4.7',
                        distance: '2.3 KM',
                        imagePath: 'Asset/Image/BaksoBiasa.png',
                      ),
                      const SizedBox(height: 18),
                      _buildAestheticFavoriteCard(
                        name: 'Sate ayam bang jamal',
                        tag: 'Refuse (Tanpa Plastik)',
                        tagIcon: Icons.block,
                        rating: '4.6',
                        distance: '4.3 KM',
                        imagePath: 'Asset/Image/Sate.png',
                      ),
                      const SizedBox(height: 18),
                      _buildAestheticFavoriteCard(
                        name: 'Seblak Harkit',
                        tag: 'Upcycle (Ampas Organik)',
                        tagIcon: Icons.compost,
                        rating: '4.8',
                        distance: '5.3 KM',
                        imagePath:
                            'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?auto=format&fit=crop&w=300&q=80',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // --- BOTTOM NAVIGATION BAR KONSISTEN ---
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
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
                    Icons.favorite,
                    'Favorite',
                    true,
                    3,
                  ), // Aktif
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

  // Desain Chip yang Lebih Lembut
  Widget _buildCategoryChip(int index, String title) {
    bool isSelected = _selectedCategoryIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedCategoryIndex = index),
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? _primaryGreen : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isSelected ? _primaryGreen : Colors.grey.shade200,
            width: 1.5,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: _primaryGreen.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey.shade700,
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
          ),
        ),
      ),
    );
  }

  // Desain Kartu Favorit Modern (Ikon Hati Melayang di Gambar)
  Widget _buildAestheticFavoriteCard({
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
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          // Bagian Gambar
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: isNetworkImage
                    ? Image.network(
                        imagePath,
                        width: double.infinity,
                        height: 140,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        imagePath,
                        width: double.infinity,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
              ),
              // Ikon Hati Melayang
              Positioned(
                top: 12,
                right: 12,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 18,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red.shade400,
                    size: 20,
                  ),
                ),
              ),
              // Tag Eco-Friendly Melayang
              Positioned(
                bottom: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.95),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(tagIcon, color: _primaryGreen, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        tag,
                        style: TextStyle(
                          color: _primaryGreen,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Bagian Teks & Info Bawah
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                    const SizedBox(width: 4),
                    Text(
                      rating,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Icon(
                      Icons.location_on,
                      color: Colors.grey.shade400,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      distance,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
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
            nextScreen = const SearchPage();
            break;
          case 2:
            nextScreen = const OrderPage();
            break;
          case 3:
            return; // Sudah di Favorite
          case 4:
            nextScreen = const AccountPage();
            break;
          default:
            return;
        }
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => nextScreen,
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
