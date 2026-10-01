import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  final String restaurantName;
  final String imagePath;
  final bool isNetworkImage;
  // Variabel baru untuk menampung daftar menu dari HomePage
  final List<dynamic> menus;

  const MenuPage({
    super.key,
    required this.restaurantName,
    required this.imagePath,
    required this.isNetworkImage,
    required this.menus, // Wajib diisi saat dipanggil
  });

  // Warna hijau utama Nest Food
  final Color _primaryGreen = const Color(0xFF38683A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // --- 1. HEADER GAMBAR RESTORAN ---
          SliverAppBar(
            expandedHeight: 280.0,
            pinned: true,
            backgroundColor: _primaryGreen,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.black.withOpacity(0.3),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 22,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.3),
                  child: IconButton(
                    icon: const Icon(
                      Icons.map_outlined,
                      color: Colors.white,
                      size: 22,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              const SizedBox(width: 8),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: isNetworkImage
                  ? Image.network(imagePath, fit: BoxFit.cover)
                  : Image.asset(imagePath, fit: BoxFit.cover),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(25),
              child: Container(
                height: 25,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              ),
            ),
          ),

          // --- 2. KONTEN DETAIL RESTORAN ---
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Judul & Ikon Hati
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          restaurantName,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),
                      Icon(Icons.favorite, color: _primaryGreen, size: 32),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Info Rating
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xFFFFB800),
                        size: 22,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        '5.0',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '(1,3RB ulasan)',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Icon(Icons.circle, color: _primaryGreen, size: 10),
                      const SizedBox(width: 6),
                      Text(
                        '2.3KM',
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Tags
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: [
                        _buildTag('UMKM LOKAL'),
                        const SizedBox(width: 10),
                        _buildTag('Kemasan Reusable'),
                        const SizedBox(width: 10),
                        _buildTag('Terlaris'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),

                  // --- 3. DAFTAR MENU MAKANAN (DIBUAT DINAMIS BERDASARKAN DATA) ---
                  // Melakukan looping (.map) pada data menus yang dikirim dari HomePage
                  ...menus.map((menuItem) {
                    return _buildMenuItemList(
                      menuItem['name'],
                      menuItem['price'],
                      menuItem['image'],
                    );
                  }).toList(),

                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // WIDGET KUSTOM: Label (Tags) Hijau
  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFE5F2E6).withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _primaryGreen.withOpacity(0.6), width: 1),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: _primaryGreen,
          fontSize: 11,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
        ),
      ),
    );
  }

  // WIDGET KUSTOM: Baris Daftar Menu
  Widget _buildMenuItemList(String name, String price, String imageUrl) {
    // Mengecek apakah gambar menu berupa URL internet atau aset lokal
    bool isMenuNetwork = imageUrl.startsWith('http');

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Gambar Menu
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: isMenuNetwork
                      ? Image.network(imageUrl, fit: BoxFit.cover)
                      : Image.asset(imageUrl, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 16),

              // Nama dan Harga Menu
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      price,
                      style: TextStyle(
                        color: _primaryGreen,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // Tombol Tambah (+)
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: _primaryGreen,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: _primaryGreen.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.add, color: Colors.white, size: 22),
                  onPressed: () {
                    // Aksi saat menambah pesanan ke keranjang
                  },
                ),
              ),
            ],
          ),
        ),

        Divider(color: Colors.grey.shade200, thickness: 1.2, height: 10),
      ],
    );
  }
}
