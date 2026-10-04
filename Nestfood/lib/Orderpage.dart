import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'SearchPage.dart';
import 'Favorite.dart';
import 'AccountPage.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final Color _primaryGreen = const Color(0xFF38683A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F5),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 120),
            child: Column(
              children: [
                // --- 1. HEADER PETA MELAYANG (ESTETIK) ---
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 300,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://images.unsplash.com/photo-1524661135-423995f22d0b?auto=format&fit=crop&w=800&q=80',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Efek gradasi agar tulisan di atas map terlihat jelas
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.4),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 55,
                      left: 20,
                      right: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 22,
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: _primaryGreen,
                                size: 20,
                              ),
                              onPressed: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const HomePage(),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'Lacak Pesanan',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Marker Map
                    Positioned(
                      top: 130,
                      left: MediaQuery.of(context).size.width / 2 - 25,
                      child: Icon(
                        Icons.location_on,
                        color: _primaryGreen,
                        size: 50,
                      ),
                    ),
                  ],
                ),

                // --- 2. KARTU STATUS (TIMELINE) ---
                Transform.translate(
                  offset: const Offset(
                    0,
                    -40,
                  ), // Kartu melayang naik menimpa peta
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            blurRadius: 20,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Estimasi Tiba',
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '12:45 PM',
                                    style: TextStyle(
                                      color: _primaryGreen,
                                      fontSize: 26,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.orange.shade50,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'Di Jalan',
                                  style: TextStyle(
                                    color: Colors.orange.shade700,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Divider(height: 1),
                          ),
                          // Custom Stepper/Timeline
                          Row(
                            children: [
                              _buildStepIcon(Icons.receipt_long, true),
                              _buildStepLine(true),
                              _buildStepIcon(Icons.soup_kitchen, true),
                              _buildStepLine(true),
                              _buildStepIcon(Icons.delivery_dining, true),
                              _buildStepLine(false), // Driver aktif
                              _buildStepIcon(Icons.home, false),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'Mitra sedang dalam perjalanan (2.3 KM)',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // --- 3. KARTU DRIVER ---
                Transform.translate(
                  offset: const Offset(0, -20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.grey.shade200,
                          width: 1.5,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 28,
                                backgroundImage: const NetworkImage(
                                  'https://images.unsplash.com/photo-1599566150163-29194dcaad36?auto=format&fit=crop&w=150&q=80',
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Budi Santoso',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Honda Vario • B 1234 XYZ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.amber.shade50,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 16,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      '4.9',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.chat_bubble_outline,
                                    size: 18,
                                  ),
                                  label: const Text('Chat Driver'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: _primaryGreen,
                                    foregroundColor: Colors.white,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: _primaryGreen,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.phone,
                                    color: _primaryGreen,
                                    size: 22,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // --- 4. VENTURE CREATION FEATURE (ECO-IMPACT) ---
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: const Color(
                        0xFFF0F7F0,
                      ), // Latar belakang hijau estetik
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFFC7DCC9),
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text('🌱', style: TextStyle(fontSize: 22)),
                            const SizedBox(width: 10),
                            Text(
                              'Dampak 3R Pesanan Ini',
                              style: TextStyle(
                                color: _primaryGreen,
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.red.shade50,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.block,
                                color: Colors.red.shade400,
                                size: 16,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'Refuse: Kamu menghemat 2 alat makan plastik sekali pakai.',
                                style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 12,
                                  height: 1.5,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.green.shade50,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.recycling,
                                color: _primaryGreen,
                                size: 16,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'Recycle: UMKM ini menggunakan wadah reusable untuk pesananmu.',
                                style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 12,
                                  height: 1.5,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            onPressed: () => _showRecycleDialog(context),
                            icon: Icon(
                              Icons.sync_alt,
                              color: _primaryGreen,
                              size: 18,
                            ),
                            label: const Text('Jadwalkan Pengembalian Wadah'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: _primaryGreen,
                              side: BorderSide(
                                color: _primaryGreen,
                                width: 1.5,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Center(
                          child: Text(
                            '*Dapatkan +50 Poin Eco setelah penjemputan',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
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

          // --- BOTTOM NAVIGATION BAR KONSISTEN ---
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBottomNavItem(
                    context,
                    Icons.home_outlined,
                    'Home',
                    false,
                    0,
                  ),
                  _buildBottomNavItem(
                    context,
                    Icons.search_outlined,
                    'Search',
                    false,
                    1,
                  ),
                  _buildBottomNavItem(
                    context,
                    Icons.receipt_long,
                    'Pesanan',
                    true,
                    2,
                  ), // Aktif
                  _buildBottomNavItem(
                    context,
                    Icons.favorite_border,
                    'Favorite',
                    false,
                    3,
                  ),
                  _buildBottomNavItem(
                    context,
                    Icons.person_outline,
                    'Account',
                    false,
                    4,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Desain Ikon Timeline Bulat
  Widget _buildStepIcon(IconData icon, bool isActive) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isActive ? _primaryGreen : Colors.grey.shade200,
        shape: BoxShape.circle,
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: _primaryGreen.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ]
            : [],
      ),
      child: Icon(
        icon,
        color: isActive ? Colors.white : Colors.grey.shade400,
        size: 20,
      ),
    );
  }

  // Garis Penghubung Timeline
  Widget _buildStepLine(bool isActive) {
    return Expanded(
      child: Container(
        height: 3,
        decoration: BoxDecoration(
          color: isActive ? _primaryGreen : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }

  // WIDGET NAVIGASI UNIVERSAL
  Widget _buildBottomNavItem(
    BuildContext context,
    IconData icon,
    String label,
    bool isSelected,
    int index,
  ) {
    return GestureDetector(
      onTap: () {
        if (isSelected) return;
        Widget nextScreen;
        switch (index) {
          case 0:
            nextScreen = const HomePage();
            break;
          case 1:
            nextScreen = const SearchPage();
            break;
          case 2:
            return; // Sudah di Pesanan
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
            pageBuilder: (_, __, ___) => nextScreen,
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

  // Fungsi Dialog Pop-Up Jadwal Penjemputan Wadah
  void _showRecycleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F7F0),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.recycling, color: _primaryGreen, size: 20),
              ),
              const SizedBox(width: 12),
              const Text(
                'Penjemputan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
              ),
            ],
          ),
          content: const Text(
            'Setelah kamu selesai makan, mitra bank sampah akan menjemput wadah reusable ini.\n\nSetiap pengembalian bernilai +50 Poin Eco!',
            style: TextStyle(fontSize: 13, height: 1.5, color: Colors.black87),
          ),
          actions: [
            TextButton(
              child: Text(
                'Nanti',
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _primaryGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
              ),
              child: const Text(
                'Jadwalkan Sekarang',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Jadwal penjemputan wadah berhasil diatur!'),
                    backgroundColor: Color(0xFF38683A),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
