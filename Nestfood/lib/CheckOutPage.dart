import 'package:flutter/material.dart';
import 'CartPage.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final Color primaryGreen = const Color(0xFF38683A);

  // Metode pembayaran yang dipilih
  String selectedPayment = 'OVO';

  // ============================================================
  // FORMAT HARGA
  // ============================================================
  String _formatRupiah(int number) {
    return 'Rp ${number.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]}.',
        )}';
  }

  // ============================================================
  // KONVERSI HARGA DARI STRING KE INTEGER
  // Contoh:
  // "Rp 15.000" -> 15000
  // ============================================================
  int _parsePrice(dynamic price) {
    String priceString = price.toString();

    priceString = priceString.replaceAll(
      RegExp(r'[^0-9]'),
      '',
    );

    return int.tryParse(priceString) ?? 0;
  }

  // ============================================================
  // HITUNG TOTAL MAKANAN
  // ============================================================
  int _calculateFoodTotal() {
    int total = 0;

    for (var item in globalCartItems) {
      int price = _parsePrice(item['price']);
      int quantity = item['quantity'] ?? 1;

      total += price * quantity;
    }

    return total;
  }

  // ============================================================
  // BIAYA KEMASAN
  // ============================================================
  int _calculatePackaging() {
    if (globalCartItems.isEmpty) {
      return 0;
    }

    return 2000;
  }

  // ============================================================
  // TOTAL AKHIR
  // ============================================================
  int _calculateGrandTotal() {
    return _calculateFoodTotal() + _calculatePackaging();
  }

  // ============================================================
  // PEMILIHAN METODE PEMBAYARAN
  // ============================================================
  Widget _buildPaymentOption({
    required String title,
    required String value,
    required IconData icon,
  }) {
    bool isSelected = selectedPayment == value;

    return InkWell(
      onTap: () {
        setState(() {
          selectedPayment = value;
        });
      },
      child: Container(
        height: 43,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade300,
              width: 0.8,
            ),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 15,
              color: primaryGreen,
            ),

            const SizedBox(width: 8),

            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: primaryGreen,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            Container(
              width: 17,
              height: 17,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? primaryGreen
                      : Colors.grey.shade500,
                  width: 1.2,
                ),
                color: isSelected
                    ? primaryGreen
                    : Colors.transparent,
              ),
              child: isSelected
                  ? const Icon(
                      Icons.circle,
                      size: 8,
                      color: Colors.white,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // ITEM MAKANAN
  // ============================================================
  Widget _buildOrderItem(Map<String, dynamic> item) {
    String image = item['image']?.toString() ?? '';
    String name = item['name']?.toString() ?? 'Makanan';
    String price = item['price']?.toString() ?? 'Rp 0';
    int quantity = item['quantity'] ?? 1;

    bool isNetworkImage = image.startsWith('http');

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: const Color(0xFFB9CDBA),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // ======================================================
          // GAMBAR MAKANAN
          // ======================================================
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: image.isEmpty
                ? Container(
                    width: 48,
                    height: 48,
                    color: Colors.grey.shade200,
                    child: Icon(
                      Icons.fastfood,
                      color: Colors.grey.shade500,
                    ),
                  )
                : isNetworkImage
                    ? Image.network(
                        image,
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                        errorBuilder: (
                          context,
                          error,
                          stackTrace,
                        ) {
                          return Container(
                            width: 48,
                            height: 48,
                            color: Colors.grey.shade200,
                            child: const Icon(
                              Icons.fastfood,
                              color: Colors.grey,
                            ),
                          );
                        },
                      )
                    : Image.asset(
                        image,
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                        errorBuilder: (
                          context,
                          error,
                          stackTrace,
                        ) {
                          return Container(
                            width: 48,
                            height: 48,
                            color: Colors.grey.shade200,
                            child: const Icon(
                              Icons.fastfood,
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),
          ),

          const SizedBox(width: 10),

          // ======================================================
          // NAMA MAKANAN
          // ======================================================
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                color: primaryGreen,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          // ======================================================
          // HARGA + JUMLAH
          // ======================================================
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 9,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 3),

              Text(
                'x$quantity',
                style: TextStyle(
                  color: primaryGreen,
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // TOMBOL BAYAR
  // ============================================================
  void _processPayment() {
    if (globalCartItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Keranjang masih kosong.'),
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Pesanan Berhasil',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Pembayaran menggunakan $selectedPayment berhasil diproses.\n\n'
            'Total: ${_formatRupiah(_calculateGrandTotal())}',
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Kosongkan keranjang setelah pembayaran
                globalCartItems.clear();

                // Tutup dialog
                Navigator.pop(context);

                // Kembali dari CheckoutPage
                Navigator.pop(context);
              },
              child: Text(
                'OK',
                style: TextStyle(
                  color: primaryGreen,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ============================================================
  // BUILD
  // ============================================================
  @override
  Widget build(BuildContext context) {
    final int foodTotal = _calculateFoodTotal();
    final int packaging = _calculatePackaging();
    final int grandTotal = _calculateGrandTotal();

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 390,
            ),
            child: Column(
              children: [
                // ==================================================
                // HEADER
                // ==================================================
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    15,
                    10,
                    15,
                    5,
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Icon(
                            Icons.arrow_back,
                            color: primaryGreen,
                            size: 18,
                          ),
                        ),
                      ),

                      const SizedBox(width: 5),

                      Text(
                        'Checkout',
                        style: TextStyle(
                          color: primaryGreen,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // ==================================================
                // ISI CHECKOUT
                // ==================================================
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ==================================================
                        // ALAMAT
                        // ==================================================
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: primaryGreen,
                            borderRadius: BorderRadius.circular(9),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Alamat',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(height: 8),

                                    const Text(
                                      'Jl. Sutera no 12 Alam',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 8,
                                      ),
                                    ),

                                    const Text(
                                      'sutera,tangerang Selatan 21033',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 8,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Column(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                    size: 14,
                                  ),

                                  const SizedBox(height: 5),

                                  GestureDetector(
                                    onTap: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Fitur ubah alamat belum tersedia.',
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'Ubah',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 8,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 13),

                        // ==================================================
                        // PESANAN
                        // ==================================================
                        Text(
                          'Pesanan',
                          style: TextStyle(
                            color: primaryGreen,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 7),

                        if (globalCartItems.isEmpty)
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: const Center(
                              child: Text(
                                'Tidak ada pesanan.',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          )
                        else
                          ...globalCartItems.map(
                            (item) => _buildOrderItem(item),
                          ),

                        const SizedBox(height: 5),

                        // ==================================================
                        // METODE PEMBAYARAN
                        // ==================================================
                        Text(
                          'Metode pembayaran',
                          style: TextStyle(
                            color: primaryGreen,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 7),

                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(9),
                            border: Border.all(
                              color: const Color(0xFFB9CDBA),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              _buildPaymentOption(
                                title: 'OVO',
                                value: 'OVO',
                                icon: Icons.account_balance_wallet,
                              ),

                              _buildPaymentOption(
                                title: 'Tunai',
                                value: 'Tunai',
                                icon: Icons.credit_card,
                              ),

                              _buildPaymentOption(
                                title: 'Transfer Bank',
                                value: 'Transfer Bank',
                                icon: Icons.account_balance,
                              ),

                              // Item terakhir tidak perlu garis bawah
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedPayment = 'Gopay';
                                  });
                                },
                                child: Container(
                                  height: 43,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.account_balance_wallet,
                                        size: 15,
                                        color: primaryGreen,
                                      ),

                                      const SizedBox(width: 8),

                                      Expanded(
                                        child: Text(
                                          'Gopay',
                                          style: TextStyle(
                                            color: primaryGreen,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),

                                      Container(
                                        width: 17,
                                        height: 17,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: selectedPayment ==
                                                    'Gopay'
                                                ? primaryGreen
                                                : Colors.grey.shade500,
                                            width: 1.2,
                                          ),
                                          color: selectedPayment ==
                                                  'Gopay'
                                              ? primaryGreen
                                              : Colors.transparent,
                                        ),
                                        child: selectedPayment == 'Gopay'
                                            ? const Icon(
                                                Icons.circle,
                                                size: 8,
                                                color: Colors.white,
                                              )
                                            : null,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 30),

                        // ==================================================
                        // RINGKASAN TOTAL
                        // ==================================================
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                color: primaryGreen,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            Text(
                              _formatRupiah(grandTotal),
                              style: TextStyle(
                                color: primaryGreen,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        // ==================================================
                        // TOMBOL BAYAR
                        // ==================================================
                        SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: _processPayment,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryGreen,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9),
                              ),
                            ),
                            child: const Text(
                              'Bayar Sekarang',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Supaya tampilan tidak terlalu mepet
                        Text(
                          'Subtotal makanan: ${_formatRupiah(foodTotal)}',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 8,
                          ),
                        ),

                        Text(
                          'Kemasan reusable: ${_formatRupiah(packaging)}',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 8,
                          ),
                        ),

                        const SizedBox(height: 20),
                      ],
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