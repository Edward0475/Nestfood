import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  final Color primaryGreen = const Color(0xFF38683A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            // =========================
            // HEADER
            // =========================
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: primaryGreen,
                      size: 22,
                    ),
                  ),

                  const SizedBox(width: 8),

                  Text(
                    'Keranjang',
                    style: TextStyle(
                      color: primaryGreen,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // =========================
            // ISI KERANJANG
            // =========================
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 20),
                child: Column(
                  children: [
                    _buildCartItem(
                      image: 'Asset/Image/Sate.Png',
                      name: 'Sate Bang Jamal',
                      description: 'Sate ayam + lontong',
                      price: 'Rp. 20.000',
                    ),

                    const SizedBox(height: 12),

                    _buildCartItem(
                      image: 'Asset/Image/Sate.Png',
                      name: 'Sate Bang Jamal',
                      description: 'Sate ayam + lontong',
                      price: 'Rp. 20.000',
                    ),

                    const SizedBox(height: 12),

                    // =========================
                    // KEMASAN
                    // =========================
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Kemasan',
                        style: TextStyle(
                          color: primaryGreen,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 6),

                    _buildPackagingOption(
                      icon: Icons.recycling,
                      title: 'Reusable',
                      subtitle: '(Dikembalikan)',
                      price: '+2.000',
                    ),

                    const SizedBox(height: 8),

                    // =========================
                    // PESANAN TANPA PLASTIK
                    // =========================
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE5F1E6),
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                          color: const Color(0xFFC7DCC9),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Text(
                            '🌱',
                            style: TextStyle(fontSize: 22),
                          ),

                          const SizedBox(width: 8),

                          Expanded(
                            child: Text(
                              'Tidak perlu alat makan sekali pakai\n'
                              'termasuk telah mendukung UMKM',
                              style: TextStyle(
                                color: primaryGreen,
                                fontSize: 9,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    // =========================
                    // TOTAL
                    // =========================
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                            color: primaryGreen,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        Text(
                          'Rp.40.000',
                          style: TextStyle(
                            color: primaryGreen,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // =========================
                    // BUTTON BUAT PESANAN
                    // =========================
                    SizedBox(
                      width: double.infinity,
                      height: 42,
                      child: ElevatedButton(
                        onPressed: () {
                          // Nanti bisa diarahkan ke halaman checkout
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryGreen,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Buat pesanan',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
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

  // =====================================================
  // ITEM MAKANAN
  // =====================================================

  Widget _buildCartItem({
    required String image,
    required String name,
    required String description,
    required String price,
  }) {
    return Container(
      width: double.infinity,
      height: 90,
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFB5CCB7),
        ),
      ),
      child: Row(
        children: [
          // FOTO
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 9),

          // DETAIL
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 8,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 2),

                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 8,
                    color: Colors.black87,
                  ),
                ),

                const Spacer(),

                // JUMLAH
                Row(
                  children: [
                    Container(
                      width: 38,
                      height: 18,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          '-   1   +',
                          style: TextStyle(fontSize: 7),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // DELETE
          const Padding(
            padding: EdgeInsets.only(right: 5),
            child: Icon(
              Icons.delete,
              color: Color(0xFF38683A),
              size: 15,
            ),
          ),
        ],
      ),
    );
  }

  // =====================================================
  // KEMASAN
  // =====================================================

  Widget _buildPackagingOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required String price,
  }) {
    return Container(
      width: double.infinity,
      height: 38,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F8F4),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 25,
            height: 25,
            decoration: const BoxDecoration(
              color: Color(0xFFDDEDDD),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.recycling,
              color: Color(0xFF38683A),
              size: 16,
            ),
          ),

          const SizedBox(width: 7),

          Text(
            title,
            style: const TextStyle(
              fontSize: 8,
              color: Color(0xFF38683A),
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(width: 3),

          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 7,
              color: Colors.grey,
            ),
          ),

          const Spacer(),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 3,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey.shade300,
              ),
            ),
            child: Text(
              price,
              style: const TextStyle(
                fontSize: 7,
                color: Color(0xFF38683A),
              ),
            ),
          ),
        ],
      ),
    );
  }
}