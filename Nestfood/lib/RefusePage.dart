import 'package:flutter/material.dart';
import 'RecyclePage.dart';

class RefusePage extends StatelessWidget {
  const RefusePage({super.key});

  // Menggunakan warna hijau utama Nest Food
  final Color _primaryGreen = const Color(0xFF38683A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60), // Jarak dari atas layar
              // 1. Judul Halaman (Title) - Font ABeeZee ukuran 36
              Text(
                'Refuse',
                style: TextStyle(
                  fontFamily: 'ABeeZee', // Menggunakan font ABeeZee
                  fontSize: 36, // Ukuran head diubah menjadi 36
                  fontWeight: FontWeight.w900,
                  color: _primaryGreen,
                ),
              ),
              const SizedBox(height: 20),

              // 2. Sub-judul / Deskripsi (Subtitle) - Font ABeeZee ukuran 22
              Text(
                'Kurangin penggunaan plastik\nsekali pakai pilih kemasan\nrama lingkungan atau bawa\nwadah sendiri',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'ABeeZee', // Menggunakan font ABeeZee
                  fontSize: 22, // Ukuran kalimat diubah menjadi 22
                  color: _primaryGreen,
                  fontWeight: FontWeight.w500,
                  height:
                      1.4, // Mengatur jarak antar baris teks agar tidak bertumpuk
                ),
              ),

              // 3. Gambar Box (Menggunakan Expanded agar fleksibel di tengah)
              Expanded(
                child: Center(
                  child: Image.asset(
                    'Asset/Image/Box.png',
                    fit: BoxFit.contain,
                    height: 250,
                  ),
                ),
              ),

              // 4. Indikator Halaman (Dots)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDot(isActive: true),
                  const SizedBox(width: 8),
                  _buildDot(isActive: false),
                  const SizedBox(width: 8),
                  _buildDot(isActive: false),
                ],
              ),
              const SizedBox(height: 40),

              // 5. Tombol Selanjutnya
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RecyclePage(),
                    ),
                  );
                  // Aksi untuk pindah ke halaman onboarding berikutnya (Recycle)
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _primaryGreen,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Selanjutnya',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 40), // Jarak dari bawah layar
            ],
          ),
        ),
      ),
    );
  }

  // Widget bantuan untuk membuat bulatan indikator halaman (Dots)
  Widget _buildDot({required bool isActive}) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: isActive ? _primaryGreen : Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: _primaryGreen, width: 1.5),
      ),
    );
  }
}
