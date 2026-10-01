import 'package:flutter/material.dart';

class BaksoOjoLaliPage extends StatelessWidget {
  const BaksoOjoLaliPage({super.key});

  static const Color primaryGreen = Color(0xFF2F6B3D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [

            // =========================
            // FOTO UTAMA BAKSO
            // =========================
            Stack(
              children: [
                Image.asset(
                  'Asset/Image/Food.png',
                  width: double.infinity,
                  height: 280,
                  fit: BoxFit.cover,
                ),

                // Tombol kembali
                Positioned(
                  top: 15,
                  left: 15,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),

                // Tombol map
                Positioned(
                  top: 15,
                  right: 15,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.map_outlined,
                      color: primaryGreen,
                    ),
                  ),
                ),
              ],
            ),

            // =========================
            // DETAIL RESTORAN
            // =========================
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // Nama + favorite
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Bakso Ojo Lali',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        Icon(
                          Icons.favorite,
                          color: primaryGreen,
                          size: 28,
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Rating
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 20,
                        ),
                        const SizedBox(width: 5),

                        const Text(
                          '5.0',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(width: 10),

                        const Text(
                          '(1,3RB ulasan)',
                          style: TextStyle(fontSize: 11),
                        ),

                        const SizedBox(width: 18),

                        Icon(
                          Icons.circle,
                          size: 11,
                          color: primaryGreen,
                        ),

                        const SizedBox(width: 5),

                        const Text(
                          '2.3KM',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    // Badge
                    Row(
                      children: [
                        _badge('UMKM LOKAL'),
                        const SizedBox(width: 5),
                        _badge('Kemasan Reusable'),
                        const SizedBox(width: 5),
                        _badge('Terlaris'),
                      ],
                    ),

                    const SizedBox(height: 25),

                    // =========================
                    // MENU 1
                    // =========================
                    _menuItem(
                      image: 'Asset/Image/Food.png',
                      name: 'Bakso Biasa',
                      price: 'Rp 15.000',
                    ),

                    // MENU 2
                    _menuItem(
                      image: 'Asset/Image/Foodbox.png',
                      name: 'Bakso Urat',
                      price: 'Rp 17.000',
                    ),

                    // MENU 3
                    _menuItem(
                      image: 'Asset/Image/Food.png',
                      name: 'Bakso Goreng',
                      price: 'Rp 20.000',
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

  // =========================
  // BADGE
  // =========================

  Widget _badge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFE7F1E9),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: primaryGreen,
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 9,
          color: primaryGreen,
        ),
      ),
    );
  }

  // =========================
  // MENU ITEM + FOTO
  // =========================

  Widget _menuItem({
    required String image,
    required String name,
    required String price,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFE0E0E0),
          ),
        ),
      ),
      child: Row(
        children: [

          // FOTO MENU
          ClipOval(
            child: Image.asset(
              image,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 12),

          // NAMA + HARGA
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 12,
                    color: primaryGreen,
                  ),
                ),
              ],
            ),
          ),

          // TOMBOL +
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: primaryGreen,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}