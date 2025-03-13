import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';
import 'chat.dart';
import 'wishlist.dart';
import 'checkout.dart';
import 'monitor_pesanan.dart';

class PembelianPaketPage extends StatelessWidget {
  final List<Map<String, dynamic>> paketList = [
    {
      'image': 'assets/paket1.png',
      'title': 'Paket Hemat',
      'desc': 'Cocok untuk solo traveler atau pemula',
      'originalPrice': 'Rp 500k',
      'discountedPrice': 'Rp 450k',
      'rating': 4.5,
    },
    {
      'image': 'assets/paket2.png',
      'title': 'Paket Ekonomis',
      'desc': 'Ideal untuk berkemah bersama keluarga',
      'originalPrice': 'Rp 750k',
      'discountedPrice': 'Rp 650k',
      'rating': 4.8,
    },
    {
      'image': 'assets/paket3.png',
      'title': 'Paket Lengkap',
      'desc': 'Peralatan lengkap dengan kualitas terbaik',
      'originalPrice': 'Rp 1.000k',
      'discountedPrice': 'Rp 850k',
      'rating': 4.7,
    },
    {
      'image': 'assets/paket4.png',
      'title': 'Paket Promo',
      'desc': 'Cocok untuk perjalanan outdoor yang ekstrim',
      'originalPrice': 'Rp 1.500k',
      'discountedPrice': 'Rp 1.300k',
      'rating': 4.9,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Pembelian Paket",
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pilih Paket Camping Anda",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),

            // GridView Paket
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 kolom agar lebih rapi
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.65, // Dikurangi untuk memberi ruang pada gambar yang lebih besar
                ),
                itemCount: paketList.length,
                itemBuilder: (context, index) {
                  final paket = paketList[index];
                  return PaketItem(
                    image: paket['image']!,
                    title: paket['title']!,
                    desc: paket['desc']!,
                    originalPrice: paket['originalPrice']!,
                    discountedPrice: paket['discountedPrice']!,
                    rating: paket['rating'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.green[400],
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed, // Menambahkan ini untuk menghindari overflow pada bottom nav
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Wishlist'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Transactions'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: 'Cart'),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              break;
            case 1:
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage()));
              break;
            case 2:
              Navigator.push(context, MaterialPageRoute(builder: (context) => WishlistPage()));
              break;
            case 3:
              Navigator.push(context, MaterialPageRoute(builder: (context) => MonitorPesananPage()));
              break;
            case 4:
              // FIXED: Cart button now navigates to CheckoutPage
              Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutPage()));
              break;
          }
        },
      ),
    );
  }
}

// Card Paket dengan Fix Overflow, Rating, dan Gambar yang Lebih Besar
class PaketItem extends StatelessWidget {
  final String image, title, desc, originalPrice, discountedPrice;
  final double rating;

  PaketItem({
    required this.image,
    required this.title,
    required this.desc,
    required this.originalPrice,
    required this.discountedPrice,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar (Lebih besar dan tidak terpotong)
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), 
              topRight: Radius.circular(12)
            ),
            child: Container(
              width: double.infinity,
              height: 130, // Tinggi gambar ditambah
              child: Image.asset(
                image,
                fit: BoxFit.contain, // Menggunakan contain agar gambar tidak terpotong
                errorBuilder: (context, error, stackTrace) {
                  // Fallback jika gambar tidak ditemukan
                  return Container(
                    color: Colors.grey[700],
                    child: Center(
                      child: Icon(
                        Icons.image_not_supported,
                        color: Colors.white54,
                        size: 40,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          
          // Content area with fixed padding
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama Paket
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  SizedBox(height: 2),
                  
                  // Rating
                  Row(
                    children: [
                      // Star icon
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 14,
                      ),
                      SizedBox(width: 2),
                      // Rating text
                      Text(
                        rating.toString(),
                        style: GoogleFonts.poppins(
                          color: Colors.amber,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 2),
                  
                  // Deskripsi Paket
                  Text(
                    desc,
                    style: GoogleFonts.poppins(
                      color: Colors.white54,
                      fontSize: 11,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  SizedBox(height: 4),
                  
                  // Harga & Diskon
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          originalPrice,
                          style: GoogleFonts.poppins(
                            color: Colors.red,
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          discountedPrice,
                          style: GoogleFonts.poppins(
                            color: Colors.green[400],
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  
                  Spacer(), // Mendorong tombol ke bawah
                  
                  // Tombol Beli Sekarang
                  SizedBox(
                    width: double.infinity,
                    height: 36,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[400],
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Beli Sekarang",
                          style: GoogleFonts.poppins(
                            color: Colors.black, 
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

