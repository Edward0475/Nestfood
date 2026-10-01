import 'package:flutter/material.dart';
import 'CheckOutPage.dart'; // Pastikan file CheckoutPage.dart berada di folder yang sama (lib/)

// ===================================================================
// VARIABEL GLOBAL: Untuk menyimpan data keranjang sementara
// Bisa diakses dari MenuPage untuk menambahkan pesanan
// ===================================================================
List<Map<String, dynamic>> globalCartItems = [];

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final Color primaryGreen = const Color(0xFF38683A);

  // Fungsi untuk menghapus item dari keranjang
  void _removeItem(int index) {
    setState(() {
      globalCartItems.removeAt(index);
    });
  }

  // Fungsi untuk menghitung total harga keranjang
  String _calculateTotal() {
    int total = 0;
    for (var item in globalCartItems) {
      // Mengubah string "Rp 15.000" menjadi angka 15000
      String priceStr = item['price'].toString().replaceAll(
        RegExp(r'[^0-9]'),
        '',
      );
      int price = int.tryParse(priceStr) ?? 0;
      int quantity = item['quantity'] ?? 1;
      total += (price * quantity);
    }
    // Jika ada item, kita tambah Rp 2000 untuk kemasan reusable
    if (globalCartItems.isNotEmpty) {
      total += 2000;
    }

    // Format kembali ke teks Rp
    return 'Rp ${total.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}';
  }

  @override
  Widget build(BuildContext context) {
    bool isCartEmpty = globalCartItems.isEmpty;

    return Scaffold(
      backgroundColor: Colors.white,

      // HEADER
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

      // BAGIAN BAWAH (Hanya muncul jika keranjang tidak kosong)
      bottomNavigationBar: isCartEmpty
          ? null
          : Container(
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
                          _calculateTotal(), // Harga total dinamis
                          style: TextStyle(
                            color: primaryGreen,
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {
                        // Nanti bisa diarahkan ke halaman pembayaran
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CheckoutPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryGreen,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 55),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'Buat pesanan',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

      // ISI HALAMAN UTAMA
      body: isCartEmpty
          ? _buildEmptyCart() // Tampilkan ini jika kosong
          : _buildCartContent(), // Tampilkan ini jika ada isinya
    );
  }

  // =====================================================
  // TAMPILAN JIKA KERANJANG KOSONG
  // =====================================================
  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 100,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 20),
          Text(
            'Keranjangmu masih kosong',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Yuk, cari makanan enak untuk mendukung UMKM!',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryGreen,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text('Cari Makanan'),
          ),
        ],
      ),
    );
  }

  // =====================================================
  // TAMPILAN JIKA KERANJANG TERISI
  // =====================================================
  Widget _buildCartContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Me-loop data dari globalCartItems
          ...List.generate(globalCartItems.length, (index) {
            final item = globalCartItems[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: _buildCartItem(
                index: index,
                image: item['image'],
                name: item['name'],
                description: item['description'],
                price: item['price'],
                quantity: item['quantity'],
              ),
            );
          }),

          const SizedBox(height: 10),

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

          // Banner Go-Green
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFE5F2E6),
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
                      fontSize: 12,
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
    );
  }

  // =====================================================
  // WIDGET ITEM MAKANAN DI KERANJANG
  // =====================================================
  Widget _buildCartItem({
    required int index,
    required String image,
    required String name,
    required String description,
    required String price,
    required int quantity,
  }) {
    bool isNetworkImage = image.startsWith('http');

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
            child: isNetworkImage
                ? Image.network(image, width: 80, height: 80, fit: BoxFit.cover)
                : Image.asset(image, width: 80, height: 80, fit: BoxFit.cover),
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
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 14,
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
              IconButton(
                onPressed: () => _removeItem(index), // Memanggil fungsi hapus
                constraints: const BoxConstraints(),
                padding: const EdgeInsets.only(bottom: 10, right: 0),
                icon: Icon(Icons.delete_outline, color: primaryGreen, size: 22),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        if (quantity > 1) {
                          setState(() => globalCartItems[index]['quantity']--);
                        }
                      },
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        quantity.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() => globalCartItems[index]['quantity']++);
                      },
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
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color(0xFFDDEDDD),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: primaryGreen, size: 20),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: primaryGreen,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          const Spacer(),
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
                fontSize: 12,
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
