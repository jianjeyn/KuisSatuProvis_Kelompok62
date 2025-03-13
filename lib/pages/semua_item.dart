import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';
import 'chat.dart';
import 'wishlist.dart';
import 'checkout.dart';
import 'pembelian_paket.dart';
import 'monitor_pesanan.dart';
import 'rincian_item.dart';

class SemuaItemPage extends StatefulWidget {
  @override
  _SemuaItemPageState createState() => _SemuaItemPageState();
}

class _SemuaItemPageState extends State<SemuaItemPage> {
  final List<Map<String, dynamic>> allProducts = [
    {
      'name': 'Camp Tent',
      'price': 'Rp 200k/day',
      'category': 'Tenda',
      'image': 'assets/tent_hiking.png',
      'isFavorite': true,
      'description': 'Perfect for your camping adventure.',
      'rating': 4.5,
    },
    {
      'name': 'Hiking Boots',
      'price': 'Rp 50k/day',
      'category': 'Sepatu',
      'image': 'assets/boots_hiking.png',
      'isFavorite': false,
      'description': 'Durable boots for your hiking needs.',
      'rating': 4.0,
    },
    {
      'name': 'Jacket',
      'price': 'Rp 120k/day',
      'category': 'Pakaian',
      'image': 'assets/jaket.png',
      'isFavorite': true,
      'description': 'Warm jacket for cold nights.',
      'rating': 4.6,
    },
    {
      'name': 'HeadLamp',
      'price': 'Rp 40k/day',
      'category': 'Peralatan Cahaya',
      'image': 'assets/headlamp.png',
      'isFavorite': false,
      'description': 'Essential headlamp for night hiking.',
      'rating': 4.3,
    },
    {
      'name': 'Tools',
      'price': 'Rp 150k/day',
      'category': 'Peralatan',
      'image': 'assets/tools.png',
      'isFavorite': false,
      'description': 'Essential tools for outdoor activities.',
      'rating': 4.2,
    },
    {
      'name': 'Backpack',
      'price': 'Rp 100k/day',
      'category': 'Ransel',
      'image': 'assets/backpack.png',
      'isFavorite': false,
      'description': 'Large backpack for your trips.',
      'rating': 4.7,
    },
  ];

  String selectedCategory = 'Semua';
  String searchQuery = '';
  int _selectedIndex = 0; // Default to Home tab

  List<Map<String, dynamic>> get filteredProducts {
    return allProducts.where((product) {
      final matchesCategory = selectedCategory == 'Semua' || product['category'] == selectedCategory;
      final matchesSearch = product['name'].toLowerCase().contains(searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "All Equipments",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
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
                SizedBox(height: 8),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.yellow[700]!.withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 12),
                      Icon(Icons.search, color: Colors.white54, size: 20),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search camping gear...",
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.white54,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              searchQuery = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: ['Semua', 'Tenda', 'Sepatu', 'Pakaian', 'Peralatan Cahaya', 'Ransel', 'Peralatan']
                    .map((category) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      label: Text(category, style: GoogleFonts.poppins(color: Colors.white)),
                      selected: selectedCategory == category,
                      selectedColor: Colors.green[700],
                      backgroundColor: Colors.grey[800],
                      onSelected: (bool selected) {
                        setState(() {
                          selectedCategory = selected ? category : 'Semua';
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 16),

            // GridView for Products
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.65, // Adjusted to give more space for the content
                ),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return Container(
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
                        // Product Image
                        Container(
                          height: 120,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                            child: Image.asset(
                              product['image'],
                              fit: BoxFit.contain, // Changed from cover to contain
                              height: 120,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        
                        // Product Details
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min, // Added to prevent overflow
                              children: [
                                // Product Name
                                Text(
                                  product['name'],
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 4),
                                
                                // Product Price
                                Text(
                                  product['price'],
                                  style: GoogleFonts.poppins(
                                    color: Colors.green[400],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 4),
                                
                                // Product Description
                                Text(
                                  product['description'],
                                  style: GoogleFonts.poppins(
                                    color: Colors.white54,
                                    fontSize: 11,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                
                                Spacer(),
                                
                                // Rating and Favorite
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Rating
                                    Row(
                                      children: [
                                        Icon(Icons.star, color: Colors.yellow[700], size: 16),
                                        SizedBox(width: 4),
                                        Text(
                                          "${product['rating']}",
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    
                                    // Favorite Icon
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          product['isFavorite'] = !product['isFavorite'];
                                        });
                                      },
                                      child: Icon(
                                        product['isFavorite'] ? Icons.favorite : Icons.favorite_border,
                                        color: product['isFavorite'] ? Colors.red : Colors.grey[600],
                                        size: 20,
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
                },
              ),
            ),
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