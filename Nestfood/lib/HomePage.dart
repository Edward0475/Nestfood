import 'package:flutter/material.dart';
import 'AccountPage.dart';
import 'MenuPage.dart';
import 'CartPage.dart';
import 'OrderPage.dart'; // Pastikan nama file Anda OrderPage.dart atau Orderpage.dart
import 'Favorite.dart'; // Pastikan nama file Anda FavoritePage.dart atau Favorite.dart
import 'SearchPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color _primaryGreen = const Color(0xFF38683A);
  final int _selectedIndex = 0;

  // Data Makanan (DIpertahankan 100% sama)
  final List<Map<String, dynamic>> _foodItems = [
    {
      'name': 'Bakso ojo lali',
      'rating': '4.7',
      'reviews': '1,3RB',
      'distance': '2.3KM',
      'image': 'Asset/Image/Bakso.jpeg',
      'menus': [
        {
          'name': 'Bakso Biasa',
          'price': 'Rp 15.000',
          'image': 'Asset/Image/BaksoBiasa.png',
        },
        {
          'name': 'Bakso Urat',
          'price': 'Rp 17.000',
          'image': 'Asset/Image/BaksoUrat.png',
        },
        {
          'name': 'Bakso Goreng',
          'price': 'Rp 20.000',
          'image': 'Asset/Image/BaksoGoreng.png',
        },
      ],
    },
    {
      'name': 'Sate ayam bang jamal',
      'rating': '4.6',
      'reviews': '1,6RB',
      'distance': '4.3KM',
      'image': 'Asset/Image/Sate.png',
      'menus': [
        {
          'name': 'Sate Ayam Bumbu Kacang',
          'price': 'Rp 25.000',
          'image': 'Asset/Image/SateKacang.png',
        },
        {
          'name': 'Sate Taichan',
          'price': 'Rp 22.000',
          'image': 'Asset/Image/SateTaichan.png',
        },
        {
          'name': 'Lontong',
          'price': 'Rp 5.000',
          'image': 'Asset/Image/Lontong.png',
        },
      ],
    },
    {
      'name': 'Seblak Harkit',
      'rating': '4.5',
      'reviews': '1 RB',
      'distance': '5.3KM',
      'image': 'Asset/Image/Seblak.png',
      'menus': [
        {
          'name': 'Seblak Biasa',
          'price': 'Rp 12.000',
          'image': 'Asset/Image/SeblakBiasa.png',
        },
        {
          'name': 'Seblak Ceker',
          'price': 'Rp 15.000',
          'image': 'Asset/Image/SeblakCeker.png',
        },
        {
          'name': 'Seblak Spesial',
          'price': 'Rp 20.000',
          'image': 'Asset/Image/SeblakSpesial.png',
        },
      ],
    },
    {
      'name': 'Nasi goreng pak joko',
      'rating': '4.8',
      'reviews': '2 RB',
      'distance': '2.3KM',
      'image': 'Asset/Image/Nasigoreng.png',
      'menus': [
        {
          'name': 'Nasi Goreng Ayam',
          'price': 'Rp 18.000',
          'image': 'Asset/Image/NasGorAyam.png',
        },
        {
          'name': 'Nasi Goreng Seafood',
          'price': 'Rp 25.000',
          'image': 'Asset/Image/NasGorSeafood.png',
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFF9FAFB,
      ), // Latar sedikit keabuan agar desain putih menonjol
      body: Stack(
        children: [
          // --- KONTEN UTAMA ---
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 120), // Ruang untuk Nav Bar
            child: Column(
              children: [
                // --- 1. HEADER HIJAU & PENCARIAN MELAYANG ---
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        top: 60,
                        left: 24,
                        right: 24,
                        bottom: 45,
                      ),
                      decoration: BoxDecoration(
                        color: _primaryGreen,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(35),
                          bottomRight: Radius.circular(35),
                        ),
                      ),
                      child: Column(
                        children: [
                          // Lokasi, Keranjang, & Notifikasi
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                      size: 22,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Lokasi kamu',
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 11,
                                        ),
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        'Alam Sutera, Tangerang',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.white,
                                      size: 26,
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const CartPage(),
                                        ),
                                      );
                                    },
                                  ),
                                  const Icon(
                                    Icons.notifications,
                                    color: Colors.white,
                                    size: 26,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),

                    // KOTAK PENCARIAN MELAYANG (Berpindah otomatis ke SearchPage)
                    Positioned(
                      bottom: -25,
                      left: 24,
                      right: 24,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => const SearchPage(),
                              transitionDuration: Duration.zero,
                            ),
                          );
                        },
                        child: Container(
                          height: 55,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 15,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: Colors.grey.shade400,
                                size: 24,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                'Cari makanan eco-friendly...',
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: 14,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: const BoxDecoration(
                                  color: Color(0xFFE5F2E6),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.tune,
                                  color: _primaryGreen,
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 50), // Ruang karena search bar melayang
                // --- 2. KONTEN BODY (Banners, Menu, dll) ---
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Banner 1
                      _buildAestheticBanner('Asset/Image/Banner.png'),

                      const SizedBox(height: 25),

                      // Menu 3R dengan Box Mewah
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildAesthetic3RMenu(
                            'Asset/Image/Foodbox.png',
                            'Refuse',
                          ),
                          _buildAesthetic3RMenu(
                            'Asset/Image/Rec.png',
                            'Recycle',
                          ),
                          _buildAesthetic3RMenu(
                            'Asset/Image/Tre.png',
                            'Upcycle',
                          ),
                        ],
                      ),

                      const SizedBox(height: 25),

                      // Banner 2
                      _buildAestheticBanner('Asset/Image/Banner2.png'),

                      const SizedBox(height: 35),

                      // UMKM Terlaris
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'UMKM Terlaris',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color: _primaryGreen,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Container(
                                height: 3,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: _primaryGreen,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Lihat semua',
                            style: TextStyle(
                              fontSize: 12,
                              color: _primaryGreen,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Grid Menu Makanan (Desain Premium)
                      GridView.builder(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio:
                                  0.8, // Disesuaikan agar kartu lebih lega dan teks tidak terpotong
                            ),
                        itemCount: _foodItems.length,
                        itemBuilder: (context, index) {
                          return _buildAestheticFoodCard(_foodItems[index]);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // --- 3. BOTTOM NAVIGATION BAR MENGAMBANG KONSISTEN ALA IOS ---
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
                    Icons.home,
                    'Home',
                    0,
                  ), // Index 0 (Home) Aktif
                  _buildBottomNavItem(Icons.search_outlined, 'Search', 1),
                  _buildBottomNavItem(Icons.receipt_long, 'Pesanan', 2),
                  _buildBottomNavItem(Icons.favorite_border, 'Favorite', 3),
                  _buildBottomNavItem(Icons.person_outline, 'Account', 4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- KUMPULAN WIDGET KUSTOM PREMIUM ---

  // 1. Banner dengan Bayangan Halus
  Widget _buildAestheticBanner(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          imagePath,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // 2. Menu 3R dengan Kotak Estetik
  Widget _buildAesthetic3RMenu(String imagePath, String title) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: 45, height: 45, fit: BoxFit.contain),
          const SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              color: _primaryGreen,
              fontWeight: FontWeight.w900,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  // 3. Kartu Makanan (Grid) Lebih Lega dan Rapih
  Widget _buildAestheticFoodCard(Map<String, dynamic> item) {
    bool isNetworkImage = item['image'].toString().startsWith('http');
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MenuPage(
              restaurantName: item['name'],
              imagePath: item['image'],
              isNetworkImage: isNetworkImage,
              menus: item['menus'],
            ),
          ),
        );
      },
      child: Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar melengkung penuh di atas
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
                child: isNetworkImage
                    ? Image.network(
                        item['image'],
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        item['image'],
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            // Teks dan Info
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 8.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item['name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 13,
                        color: Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 14),
                        const SizedBox(width: 4),
                        Text(
                          item['rating'],
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '(${item['reviews']})',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.grey.shade400,
                          size: 12,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          item['distance'],
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 4. Navigasi Bawah Konsisten Universal
  Widget _buildBottomNavItem(IconData icon, String label, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        if (isSelected) return;
        Widget nextScreen;
        switch (index) {
          case 0:
            return; // Sudah di Home
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
            pageBuilder: (context, a1, a2) => nextScreen,
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
