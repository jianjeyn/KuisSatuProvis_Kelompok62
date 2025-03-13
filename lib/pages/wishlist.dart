import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cobaflutter/pages/chat.dart';
import 'package:cobaflutter/pages/wishlist.dart';
import 'package:cobaflutter/pages/checkout.dart';
import 'package:cobaflutter/pages/pembelian_paket.dart';
import 'package:cobaflutter/pages/home.dart';
import 'package:cobaflutter/pages/monitor_pesanan.dart';

class WishlistPage extends StatefulWidget {
  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  final List<Map<String, String>> wishlistItems = [
    {
      'image': 'assets/tent_hiking1.png',
      'title': 'Camping Tent',
      'price': '\Rp 200k',
    },
    {
      'image': 'assets/boots_hiking1.png',
      'title': 'Hiking Boots',
      'price': '\Rp 50k',
    },
  ];

  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
        break;
      case 1:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ChatPage()));
        break;
      case 2:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WishlistPage()));
        break;
      case 3:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MonitorPesananPage()));
        break;
      case 4:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CheckoutPage()));
        break;
      default:
        break;
    }
  }

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
                    "Your Wishlist",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
                  ),
                  // Profile icon added to match home page
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
                          "Search wishlist items...",
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
            Text(
              "Wishlist Items",
              style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Your saved items", style: GoogleFonts.poppins(color: Colors.grey[400], fontSize: 12)),
                Text("Clear wishlist ➝", style: GoogleFonts.poppins(color: Colors.green[400], fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),
            LayoutBuilder(
              builder: (context, constraints) {
                int columns = constraints.maxWidth > 600 ? 2 : 2;

                return GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: wishlistItems.length,
                  itemBuilder: (context, index) {
                    final item = wishlistItems[index];
                    return WishlistItem(
                      image: item['image']!,
                      title: item['title']!,
                      price: item['price']!,
                    );
                  },
                );
              },
            ),
            // Add extra space at the bottom to ensure content isn't cut off by navigation bar
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.green[400],
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed, // Added to match previous code and prevent overflow
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Wishlist'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Transactions'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: 'Cart'),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}

class WishlistItem extends StatelessWidget {
  final String image, title, price;

  WishlistItem({
    required this.image,
    required this.title,
    required this.price,
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              title,
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              price,
              style: GoogleFonts.poppins(color: Colors.green[400], fontWeight: FontWeight.bold, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

