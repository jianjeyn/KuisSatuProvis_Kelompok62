import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cobaflutter/pages/chat.dart';
import 'package:cobaflutter/pages/wishlist.dart';
import 'package:cobaflutter/pages/checkout.dart';
import 'package:cobaflutter/pages/pembelian_paket.dart';
import 'package:cobaflutter/pages/home.dart';
import 'package:cobaflutter/pages/monitor_pesanan.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final List<Map<String, String>> cartItems = [
    {
      'image': 'assets/tent_hiking.png',
      'title': 'Camping Tent',
      'price': '\Rp 200.000',
      'quantity': '2',
    },
    {
      'image': 'assets/boots_hiking.png',
      'title': 'Hiking Boots',
      'price': '\Rp 50.000',
      'quantity': '1',
    },
  ];

  int _selectedIndex = 4;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ChatPage()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => WishlistPage()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MonitorPesananPage()),
        );
        break;
      case 4:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CheckoutPage()),
        );
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
                    "My Order",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  // Profile icon added to match other pages
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
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cart Items Section
            Text(
              "Your Cart",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ImprovedCartItem(
                  image: item['image']!,
                  title: item['title']!,
                  price: item['price']!,
                  quantity: item['quantity']!,
                );
              },
            ),
            SizedBox(height: 20),
            
            // Promo Code Section
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        hintText: 'Enter Promo Code',
                        hintStyle: GoogleFonts.poppins(color: Colors.white54),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      ),
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Apply promo code
                    },
                    child: Text(
                      "Apply",
                      style: GoogleFonts.poppins(
                        color: Colors.green[400],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                ],
              ),
            ),
            
            SizedBox(height: 24),
            
            // Order Summary Card
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order Summary",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  
                  // Price breakdown
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Subtotal",
                        style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
                      ),
                      Text(
                        "\Rp 450.000",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Shipping",
                        style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
                      ),
                      Text(
                        "\Rp 10.000",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Divider(color: Colors.grey[700]),
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total (3 items)",
                        style: GoogleFonts.poppins(
                          color: Colors.white, 
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "\Rp 460.000",
                        style: GoogleFonts.poppins(
                          color: Colors.green[400],
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 24),
            
            // Proceed to Checkout Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Handle checkout action here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Proceed to Checkout",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.green[400],
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed, // Added to match previous code
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

class ImprovedCartItem extends StatelessWidget {
  final String image, title, price, quantity;

  ImprovedCartItem({
    required this.image,
    required this.title,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          // Product image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          
          // Product details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  price,
                  style: GoogleFonts.poppins(
                    color: Colors.green[400],
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          
          // Quantity controls
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove, color: Colors.white, size: 18),
                  constraints: BoxConstraints(minWidth: 32, minHeight: 32),
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    // Decrease quantity
                  },
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    quantity,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add, color: Colors.white, size: 18),
                  constraints: BoxConstraints(minWidth: 32, minHeight: 32),
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    // Increase quantity
                  },
                ),
              ],
            ),
          ),
          
          SizedBox(width: 8),
          
          // Delete button
          IconButton(
            icon: Icon(Icons.delete_outline, color: Colors.red[300]),
            onPressed: () {
              // Handle item removal
            },
          ),
        ],
      ),
    );
  }
}

