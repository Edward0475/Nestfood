import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'Orderpage.dart'; // Import halaman pesanan

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  final Color _primaryGreen = const Color(0xFF38683A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animasi/Ikon Centang Hijau Besar
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Color(0xFFE5F2E6),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check_circle,
                    color: _primaryGreen,
                    size: 100,
                  ),
                ),
                const SizedBox(height: 30),

                // Teks Keberhasilan
                Text(
                  'Pembayaran Berhasil!',
                  style: TextStyle(
                    color: _primaryGreen,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 15),

                // Pesan Terima Kasih (Venture 3R)
                const Text(
                  'Pesanan Anda sedang disiapkan oleh mitra UMKM.\n\nTerima kasih telah berpartisipasi dalam mengurangi sampah plastik (Refuse) dan mendukung ekosistem kuliner yang lebih bersih.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 50),

                // Tombol Lihat Pesanan (Utama)
                ElevatedButton(
                  onPressed: () {
                    // Berpindah ke OrderPage dan menghapus riwayat halaman checkout
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OrderPage(),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _primaryGreen,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Lihat Pesanan',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 15),

                // Tombol Kembali ke Beranda (Sekunder)
                TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: Text(
                    'Kembali ke Beranda',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
