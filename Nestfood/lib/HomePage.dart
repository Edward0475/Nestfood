import 'package:flutter/material.dart';
import 'AccountPage.dart';
import 'MenuPage.dart';
import 'CartPage.dart'; // <--- PASTIKAN IMPORT INI DITAMBAHKAN
import 'Orderpage.dart';
import 'Favorite.dart';
import 'SearchPage.dart'; // Tambahkan ini di atas HomePage.dart, AccountPage.dart, dll

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color _primaryGreen = const Color(0xFF38683A);
  int _selectedIndex = 0;

  // Data makanan
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
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // --- HEADER HIJAU LENGKUNG ---
                Container(
                  padding: const EdgeInsets.only(
                    top: 50,
                    left: 20,
                    right: 20,
                    bottom: 25,
                  ),
                  decoration: BoxDecoration(
                    color: _primaryGreen,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
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
                              const Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 30,
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Lokasi kamu',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 11,
                                    ),
                                  ),
                                  Text(
                                    'Alam Sutera, Tangerang Selatan',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // --- IKON KERANJANG DAN NOTIFIKASI ---
                          Row(
                            children: [
                              // Tombol Keranjang (Cart)
                              IconButton(
                                icon: const Icon(
                                  Icons
                                      .shopping_cart_outlined, // Icon keranjang
                                  color: Colors.white,
                                  size: 26,
                                ),
                                onPressed: () {
                                  // Navigasi ke CartPage saat ditekan
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const CartPage(),
                                    ),
                                  );
                                },
                              ),
                              const Icon(
                                Icons.notifications,
                                color: Colors.white,
                                size: 28,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Kolom Pencarian
                      Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Cari makanan',
                            hintStyle: const TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 14,
                            ),
                            suffixIcon: const Icon(
                              Icons.search,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 25.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // --- BANNER 1 ---
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: const Color.fromARGB(255, 248, 248, 248),
                            width: 2,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(13),
                          child: Image.asset(
                            'Asset/Image/Banner.png',
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // --- MENU 3R ---
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _build3RMenu('Asset/Image/Foodbox.png', 'Refuse'),
                          _build3RMenu('Asset/Image/Rec.png', 'Recycle'),
                          _build3RMenu('Asset/Image/Tre.png', 'Upcycle'),
                        ],
                      ),
                      const SizedBox(height: 30),

                      // --- BANNER 2 ---
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'Asset/Image/Banner2.png',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 30),

                      // --- JUDUL UMKM TERLARIS ---
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
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  color: _primaryGreen,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Container(
                                height: 2,
                                width: 95,
                                color: _primaryGreen,
                              ),
                            ],
                          ),
                          Text(
                            'Lihat semua',
                            style: TextStyle(
                              fontSize: 12,
                              color: _primaryGreen,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),

                      // --- GRID MENU MAKANAN ---
                      GridView.builder(
                        padding: const EdgeInsets.only(bottom: 80),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                              childAspectRatio: 0.9,
                            ),
                        itemCount: _foodItems.length,
                        itemBuilder: (context, index) {
                          final item = _foodItems[index];
                          return _buildFoodCard(item);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // --- BOTTOM NAVIGATION BAR MENGAMBANG ---
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
                border: Border.all(color: Colors.grey.shade300, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBottomNavItem(Icons.home, 'Home', 0),
                  _buildBottomNavItem(Icons.search, 'Search', 1),
                  _buildBottomNavItem(Icons.receipt_long, 'Pesanan', 2),
                  _buildBottomNavItem(Icons.favorite, 'Favorite', 3),
                  _buildBottomNavItem(Icons.person, 'Account', 4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // WIDGET KUSTOM: Menu 3R
  Widget _build3RMenu(String imagePath, String title) {
    return Container(
      width: 95,
      height: 125,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Color(0xFFE5F2E6),
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              imagePath,
              width: 35,
              height: 35,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 15),
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

  // WIDGET KUSTOM: Kartu Daftar Makanan (UMKM)
  Widget _buildFoodCard(Map<String, dynamic> item) {
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
              menus: item['menus'], // Pastikan mengirim data menu ke MenuPage
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.shade300, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Makanan
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(13),
                  topRight: Radius.circular(13),
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
            // Detail Makanan
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 8.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item['name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 11,
                        color: Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 12),
                        const SizedBox(width: 2),
                        Text(
                          item['rating'],
                          style: const TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          item['reviews'],
                          style: TextStyle(
                            fontSize: 9,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '• ${item['distance']}',
                          style: TextStyle(
                            fontSize: 9,
                            color: Colors.grey.shade600,
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

  // WIDGET KUSTOM: Bottom Navigation Item
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
            return; // Search
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
