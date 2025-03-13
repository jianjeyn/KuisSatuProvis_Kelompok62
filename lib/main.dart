import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/home.dart';
import 'pages/rincian_item.dart';
import 'pages/chat.dart';
import 'pages/wishlist.dart';
import 'pages/checkout.dart';
import 'pages/pembelian_paket.dart';
import 'pages/monitor_pesanan.dart';
import 'pages/pengembalian.dart';
import 'pages/semua_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {'title': "Halaman Depan", 'icon': Icons.home, 'page': HomePage()},
    {'title': "Semua Item", 'icon': Icons.list_alt, 'page': SemuaItemPage()},
    {'title': "Rincian Item", 'icon': Icons.info, 'page': RincianItemPage()},
    {'title': "Chat", 'icon': Icons.chat, 'page': ChatPage()},
    {'title': "Wishlist", 'icon': Icons.favorite, 'page': WishlistPage()},
    {'title': "Keranjang & Checkout", 'icon': Icons.shopping_cart, 'page': CheckoutPage()},
    {'title': "Pembelian Paket", 'icon': Icons.shopping_basket, 'page': PembelianPaketPage()},
  ];

  final List<Map<String, dynamic>> transaksiItems = [
    {'title': "Monitor Pesanan", 'icon': Icons.receipt_long, 'page': MonitorPesananPage()},
    {'title': "Pengembalian", 'icon': Icons.undo, 'page': PengembalianPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Warna latar belakang
      appBar: AppBar(
        title: Text(
          'Dashboard UI',
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Nomor Kelompok
            Text(
              "No Kelompok Praktikum: 62",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
            ),
            SizedBox(height: 20),

            // **GRID MENU UTAMA**
            Expanded(
              child: GridView.builder(
                itemCount: menuItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 Kolom
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  return buildGridButton(context, menuItems[index]);
                },
              ),
            ),

            SizedBox(height: 20),

            // **Bagian Transaksi**
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Transaksi",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 10),

                  // **Grid Menu Transaksi**
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: transaksiItems.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 2 Kolom
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 2.5,
                    ),
                    itemBuilder: (context, index) {
                      return buildSmallButton(context, transaksiItems[index]);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // **Tombol Grid Besar**
  Widget buildGridButton(BuildContext context, Map<String, dynamic> item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => item['page']));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 6, spreadRadius: 1),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(item['icon'], color: Colors.green[400], size: 40),
            SizedBox(height: 10),
            Text(
              item['title'],
              style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // **Tombol Kecil untuk Transaksi**
  Widget buildSmallButton(BuildContext context, Map<String, dynamic> item) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => item['page']));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green[400],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(vertical: 14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(item['icon'], color: Colors.black, size: 20),
          SizedBox(width: 8),
          Text(
            item['title'],
            style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
