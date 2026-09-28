import 'package:flutter/material.dart';

class RecyclePage extends StatelessWidget {
  const RecyclePage({super.key});

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
              // 1. Judul Halaman (Title)
              Text(
                'Recycle', // Typo diperbaiki dari "Recyle"
                style: TextStyle(
                  fontFamily: 'ABeeZee',
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  color: _primaryGreen,
                ),
              ),
              const SizedBox(height: 20),

              // 2. Sub-judul / Deskripsi (Subtitle)
              Text(
                'Kembalikan kemasan\nreusable setelah\ndigunakan agar dapat\ndigunakan kembali', // Typo diperbaiki
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'ABeeZee',
                  fontSize: 22,
                  color: _primaryGreen,
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                ),
              ),

              // 3. Gambar Trash / Recycle Bin
              Expanded(
                child: Center(
                  child: Image.asset(
                    'Asset/Image/Trash.png',
                    fit: BoxFit.contain,
                    height: 250,
                  ),
                ),
              ),

              // 4. Indikator Halaman (Dots) - Titik TENGAH yang aktif
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDot(isActive: false), // Titik pertama kosong
                  const SizedBox(width: 8),
                  _buildDot(isActive: true), // Titik kedua (Recycle) terisi
                  const SizedBox(width: 8),
                  _buildDot(isActive: false), // Titik ketiga kosong
                ],
              ),
              const SizedBox(height: 40),

              // 5. Tombol Selanjutnya
              ElevatedButton(
                onPressed: () {
                  // Aksi untuk pindah ke halaman onboarding ke-3 (Upcycle)
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
