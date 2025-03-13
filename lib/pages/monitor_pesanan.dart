import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';
import 'chat.dart';
import 'wishlist.dart';
import 'checkout.dart';
import 'pembelian_paket.dart';
import 'pengembalian.dart';

class MonitorPesananPage extends StatefulWidget {
  @override
  _MonitorPesananPageState createState() => _MonitorPesananPageState();
}

class _MonitorPesananPageState extends State<MonitorPesananPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> sedangDisewa = [
    {'image': 'assets/tent_hiking.png', 'title': 'Camp Tent', 'price': 'Rp 200k/day', 'status': 'Sedang Digunakan'},
    {'image': 'assets/headlamp.png', 'title': 'HeadLamp', 'price': 'Rp 40k/day', 'status': 'Dalam Persiapan'},
  ];

  final List<Map<String, dynamic>> riwayatSewa = [
    {'image': 'assets/jaket.png', 'title': 'Jacket', 'price': 'Rp 120k/day', 'status': 'Selesai'},
    {'image': 'assets/boots_hiking.png', 'title': 'Hiking Boots', 'price': 'Rp 50k/day', 'status': 'Selesai'},
  ];

  int _selectedIndex = 3;

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
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
                    "Monitor Sewa",
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
              SizedBox(height: 2),
              TabBar(
                controller: _tabController,
                indicatorColor: Colors.green,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white70,
                tabs: [
                  Tab(text: "Sedang Disewa"),
                  Tab(text: "Riwayat Sewa"),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildSewaList(sedangDisewa),
                _buildSewaList(riwayatSewa),
              ],
            ),
          ),
          // Tombol Pengembalian Barang
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PengembalianPage()));
                },
                icon: Icon(Icons.assignment_return, color: Colors.white),
                label: Text("Pengembalian Barang", style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.green[400],
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
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

  Widget _buildSewaList(List<Map<String, dynamic>> sewaList) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: sewaList.length,
      itemBuilder: (context, index) {
        final item = sewaList[index];
        return Container(
          margin: EdgeInsets.only(bottom: 12),
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
          child: ListTile(
            contentPadding: EdgeInsets.all(12),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(item['image'], width: 50, height: 50, fit: BoxFit.cover),
            ),
            title: Text(
              item['title'],
              style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['price'],
                  style: GoogleFonts.poppins(color: Colors.green[400], fontWeight: FontWeight.bold),
                ),
                Text(
                  item['status'],
                  style: GoogleFonts.poppins(color: Colors.white70),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}