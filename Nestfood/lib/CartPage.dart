import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  final Color primaryGreen = const Color(0xFF38683A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // =========================
      // HEADER
      // =========================
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryGreen, size: 26),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Keranjang',
          style: TextStyle(
            color: primaryGreen,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // =========================
      // BAGIAN BAWAH (TOTAL & CHECKOUT)
      // =========================
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Baris Total Harga
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      color: primaryGreen,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Rp 40.000',
                    style: TextStyle(
                      color: primaryGreen,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              // Tombol Buat Pesanan
              ElevatedButton(
                onPressed: () {
                  // Nanti bisa diarahkan ke halaman checkout
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryGreen,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(
                    double.infinity,
                    55,
                  ), // Sama seperti tombol Login/Keluar
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Buat pesanan',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),

      // =========================
      // ISI KERANJANG UTAMA
      // =========================
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Item Pesanan 1
            _buildCartItem(
              image:
                  'Asset/Image/Sate.png', // Pastikan huruf P-nya sesuai ekstensi asli Anda (png/Png)
              name: 'Sate Bang Jamal',
              description: 'Sate ayam + lontong',
              price: 'Rp 20.000',
            ),
            const SizedBox(height: 15),

            // Item Pesanan 2
            _buildCartItem(
              image: 'Asset/Image/Sate.png',
              name: 'Sate Bang Jamal',
              description: 'Sate ayam + lontong',
              price: 'Rp 20.000',
            ),
            const SizedBox(height: 25),

            // Judul Kemasan
            Text(
              'Kemasan',
              style: TextStyle(
                color: primaryGreen,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            // Pilihan Kemasan Reusable
            _buildPackagingOption(
              icon: Icons.recycling,
              title: 'Reusable',
              subtitle: '(Dikembalikan)',
              price: '+ Rp 2.000',
            ),
            const SizedBox(height: 15),

            // Banner Go-Green (Pesanan tanpa plastik)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFE5F2E6), // Hijau pudar
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFC7DCC9)),
              ),
              child: Row(
                children: [
                  const Text('🌱', style: TextStyle(fontSize: 24)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Tidak perlu alat makan sekali pakai,\nterima kasih telah mendukung UMKM & Lingkungan',
                      style: TextStyle(
                        color: primaryGreen,
                        fontSize: 12, // Ukuran teks yang bisa dibaca nyaman
                        fontWeight: FontWeight.w500,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =====================================================
  // WIDGET ITEM MAKANAN DI KERANJANG
  // =====================================================
  Widget _buildCartItem({
    required String image,
    required String name,
    required String description,
    required String price,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Gambar Menu
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              width: 80, // Diperbesar
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),

          // Detail Makanan
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16, // Diperbesar
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12, // Diperbesar
                    color: Colors.grey.shade600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 14, // Diperbesar
                    color: primaryGreen,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),

          // Kontrol Kuantitas & Tombol Hapus
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Ikon Hapus
              IconButton(
                onPressed: () {},
                constraints: const BoxConstraints(),
                padding: const EdgeInsets.only(bottom: 10, right: 0),
                icon: Icon(Icons.delete_outline, color: primaryGreen, size: 22),
              ),

              // Kotak Jumlah Pesanan (- 1 +)
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: Text(
                          '-',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        '1',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: Text(
                          '+',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // =====================================================
  // WIDGET OPSI KEMASAN
  // =====================================================
  Widget _buildPackagingOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required String price,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F8F4),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          // Ikon Kemasan
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color(0xFFDDEDDD),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: primaryGreen, size: 20), // Ikon diperbesar
          ),
          const SizedBox(width: 15),

          // Teks Kemasan
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14, // Diperbesar
                  color: primaryGreen,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 12, // Diperbesar
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const Spacer(),

          // Harga Kemasan
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Text(
              price,
              style: TextStyle(
                fontSize: 12, // Diperbesar
                fontWeight: FontWeight.w600,
                color: primaryGreen,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
