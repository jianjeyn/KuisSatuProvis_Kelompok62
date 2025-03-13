import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cobaflutter/pages/chat.dart';
import 'package:cobaflutter/pages/wishlist.dart';
import 'package:cobaflutter/pages/checkout.dart';
import 'package:cobaflutter/pages/pembelian_paket.dart';
import 'package:cobaflutter/pages/home.dart';
import 'package:cobaflutter/pages/semua_item.dart';
import 'package:cobaflutter/pages/monitor_pesanan.dart'; // Added import for MonitorPesananPage

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: Padding(
          padding: EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Explore the Wild",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  // Profile icon added to top right
                  CircleAvatar(
                    backgroundColor: Colors.grey[800],
                    child: IconButton(
                      icon: Icon(Icons.person, color: Colors.white),
                      onPressed: () {
                        // Handle profile button press
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Flexible(
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.white54),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Search camping gear...",
                          style: GoogleFonts.poppins(fontSize: 14, color: Colors.white54),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Equipments Section
            Text(
              "Equipments",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Special offer from our partner",
                    style: GoogleFonts.poppins(color: Colors.grey[400], fontSize: 12)),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => SemuaItemPage())
                    );
                  },
                  child: Text(
                    "View All ➝",
                    style: GoogleFonts.poppins(color: Colors.green[400], fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Alat Perkemahan (Tenda, Ransel, Sepatu)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  EquipmentItem(
                    image: 'assets/tent_hiking.png',
                    title: "Camp Tent",
                    price: "\Rp 200k/day",
                    description: "Perfect for your camping adventure.",
                    rating: 4.5,
                    isFavorited: true, 
                  ),
                  EquipmentItem(
                    image: 'assets/boots_hiking.png',
                    title: "Hiking Boots",
                    price: "\Rp 50k/day",
                    description: "Durable boots for your hiking needs.",
                    rating: 4.0,
                    isFavorited: true, 
                  ),
                  EquipmentItem(
                    image: 'assets/backpack.png',
                    title: "Backpack",
                    price: "\Rp 100k/day",
                    description: "Large backpack for your trips.",
                    rating: 4.7,
                    isFavorited: false, 
                  ),
                  EquipmentItem(
                    image: 'assets/headlamp.png',
                    title: "HeadLamp",
                    price: "\Rp 40k/day",
                    description: "Essential headlamp for night hiking.",
                    rating: 4.3,
                    isFavorited: false, 
                  ),
                  EquipmentItem(
                    image: 'assets/jaket.png',
                    title: "Jacket",
                    price: "\Rp120k/day",
                    description: "Warm jacket for cold nights.",
                    rating: 4.6,
                    isFavorited: false, 
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            // Recommended Packages Section with Price and Discount
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Recommended Packages",
                    style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => PembelianPaketPage())
                    );
                  },
                  child: Text(
                    "See all ➝",
                    style: GoogleFonts.poppins(color: Colors.green[400], fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // GridView Paket Rekomendasi (Fixed to prevent cutoff)
            GridView.builder(
              shrinkWrap: true, // Important to make it work within SingleChildScrollView
              physics: NeverScrollableScrollPhysics(), // Disable scrolling of the grid itself
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.85, // Adjusted for better proportions
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 4,
              padding: EdgeInsets.only(bottom: 16), // Add padding at bottom to prevent cutoff
              itemBuilder: (context, index) {
                List<Map<String, String>> packages = [
                  {
                    'image': 'assets/paket1.png',
                    'title': 'Paket Hemat',
                    'originalPrice': '\Rp 200k',
                    'discountedPrice': '\Rp 180k/day'
                  },
                  {
                    'image': 'assets/paket2.png',
                    'title': 'Paket Ekonomis',
                    'originalPrice': '\Rp 120k',
                    'discountedPrice': '\Rp 230k/day'
                  },
                  {
                    'image': 'assets/paket3.png',
                    'title': 'Paket Lengkap',
                    'originalPrice': '\Rp 350k',
                    'discountedPrice': '\Rp 320k/day'
                  },
                  {
                    'image': 'assets/paket4.png',
                    'title': 'Paket Promo',
                    'originalPrice': '\Rp 400k',
                    'discountedPrice': '\Rp 380k/day'
                  },
                ];
                
                return ImprovedPackageItem(
                  image: packages[index]['image']!,
                  title: packages[index]['title']!,
                  originalPrice: packages[index]['originalPrice']!,
                  discountedPrice: packages[index]['discountedPrice']!,
                );
              },
            ),
            // Add extra space at the bottom to ensure content isn't cut off by navigation bar
            SizedBox(height: 20),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.green[400],
        unselectedItemColor: Colors.grey,
        currentIndex: 0, // Set to 0 for Home
        type: BottomNavigationBarType.fixed, // Added to match previous code
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Wishlist'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Transactions'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: 'Cart'),
        ],
        onTap: (index) {
          // Handle page navigation based on selected index
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
              // FIXED: Transactions button now navigates to MonitorPesananPage
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

// Equipment Item Card
// Equipment Item Card with Favorite Button
class EquipmentItem extends StatelessWidget {
  final String image, title, price, description;
  final double rating;
  final bool isFavorited; // Tambahkan parameter ini

  EquipmentItem({
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.rating,
    this.isFavorited = false, // Default value adalah false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(15),
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
          // Favorite Button
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(
                isFavorited ? Icons.favorite : Icons.favorite_border, // Tampilkan ikon favorit berdasarkan kondisi
                color: isFavorited ? Colors.red : Colors.white, // Warna ikon favorit
              ),
              onPressed: () {
                // Handle favorite button press (UI only, no logic)
              },
            ),
          ),
          Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          SizedBox(height: 5),
          Text(
            price,
            style: GoogleFonts.poppins(color: Colors.green[400], fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 5),
          Text(
            description,
            style: GoogleFonts.poppins(color: Colors.white54, fontSize: 12),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(Icons.star, color: Colors.yellow[700], size: 16),
              SizedBox(width: 5),
              Text(
                "$rating",
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Improved Package Item Card with Price & Discount that doesn't overlap the image
class ImprovedPackageItem extends StatelessWidget {
  final String image, title, originalPrice, discountedPrice;

  ImprovedPackageItem({
    required this.image,
    required this.title,
    required this.originalPrice,
    required this.discountedPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(15),
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
          // Image container
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          
          // Info container
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        originalPrice,
                        style: GoogleFonts.poppins(
                          color: Colors.red,
                          fontSize: 12,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        discountedPrice,
                        style: GoogleFonts.poppins(
                          color: Colors.green[400],
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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