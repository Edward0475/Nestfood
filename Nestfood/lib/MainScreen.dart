import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'AccountPage.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final Color _primaryGreen = const Color(0xFF38683A);

  // Daftar halaman yang akan ditampilkan saat menu diklik
  final List<Widget> _pages = [
    const HomePage(),
    const Center(child: Text('Halaman Search (Belum Dibuat)')),
    const Center(child: Text('Halaman Pesanan (Belum Dibuat)')),
    const Center(child: Text('Halaman Favorite (Belum Dibuat)')),
    const AccountPage(), // Indeks ke-4
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 1. Konten Halaman Utama (Berganti sesuai menu yang diklik)
          _pages[_selectedIndex],

          // 2. Bottom Navigation Bar Mengambang (Hanya ditulis 1x di sini)
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

  // Desain Tombol Menu Bawah
  Widget _buildBottomNavItem(IconData icon, String label, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index; // Mengganti halaman secara otomatis
        });
      },
      child: Container(
        color: Colors.transparent, // Memperbesar area klik
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? _primaryGreen : Colors.grey.shade500,
              size: 26,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? _primaryGreen : Colors.grey.shade500,
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
