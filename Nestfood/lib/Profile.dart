import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final Color primaryGreen = const Color(0xFF38683A);

  int selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          // =========================
          // HEADER PROFIL
          // =========================
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 45, 20, 25),
            decoration: BoxDecoration(
              color: primaryGreen,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Row(
              children: [
                // Foto profil
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person,
                    size: 38,
                    color: Colors.grey.shade400,
                  ),
                ),

                const SizedBox(width: 15),

                // Nama & email
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Edward Jeremy',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'edward@gmail.com',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // =========================
          // MENU AKUN
          // =========================
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 10),
              children: [
                _buildMenuItem(
                  icon: Icons.receipt_long_outlined,
                  title: 'Pesanan Saya',
                ),

                _buildMenuItem(
                  icon: Icons.location_on_outlined,
                  title: 'Alamat Saya',
                ),

                _buildMenuItem(
                  icon: Icons.credit_card_outlined,
                  title: 'Metode Pembayaran',
                ),

                _buildMenuItem(
                  icon: Icons.settings_outlined,
                  title: 'Pengaturan',
                ),

                _buildMenuItem(
                  icon: Icons.help_outline,
                  title: 'Pusat Bantuan',
                ),

                _buildMenuItem(
                  icon: Icons.info_outline,
                  title: 'Tentang NestFood',
                ),
              ],
            ),
          ),
        ],
      ),

      // =========================
      // BOTTOM NAVIGATION
      // =========================
      bottomNavigationBar: Container(
        height: 75,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Colors.grey.shade200,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
                _buildBottomNavItem(
                    Icons.home_outlined,
                    'Home',
                    0,
                ),

                _buildBottomNavItem(
                    Icons.search,
                    'Search',
                    1,
                ),

                _buildBottomNavItem(
                    Icons.receipt_long,
                    'Pesanan',
                    2,
                ),

                _buildBottomNavItem(
                    Icons.favorite,
                    'Favorite',
                    3,
                ),

                _buildBottomNavItem(
                    Icons.person,
                    'Account',
                    4,
                ),
            ],
        ),
      ),
    );
  }

  // =========================
  // MENU ITEM
  // =========================

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      leading: Icon(
        icon,
        color: Colors.grey.shade700,
        size: 22,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 13,
          color: Colors.grey,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: Colors.grey,
        size: 20,
      ),
      onTap: () {
        // Nanti bisa diisi dengan halaman masing-masing
      },
    );
  }

  // =========================
  // BOTTOM NAV ITEM
  // =========================

  Widget _buildBottomNavItem(
    IconData icon,
    String label,
    int index,
  ) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });

        if (index == 0) {
          Navigator.pop(context);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected
                ? primaryGreen
                : Colors.grey.shade400,
            size: 24,
          ),

          const SizedBox(height: 3),

          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: isSelected
                  ? primaryGreen
                  : Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }
}