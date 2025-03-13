import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';
import 'chat.dart';
import 'wishlist.dart';
import 'checkout.dart';
import 'monitor_pesanan.dart';

class PengembalianPage extends StatefulWidget {
  @override
  _PengembalianPageState createState() => _PengembalianPageState();
}

class _PengembalianPageState extends State<PengembalianPage> {
  List<Map<String, dynamic>> daftarPengembalian = [
    {'image': 'assets/tent_hiking.png', 'title': 'Camp Tent', 'status': 'Belum Dikembalikan', 'batas': '12 Maret 2025'},
    {'image': 'assets/jaket.png', 'title': 'Jacket', 'status': 'Diproses', 'batas': '10 Maret 2025'},
    {'image': 'assets/headlamp.png', 'title': 'HeadLamp', 'status': 'Selesai', 'batas': '5 Maret 2025'},
  ];

  Color getStatusColor(String status, String batas) {
    if (status == 'Diproses') return Colors.amber;
    if (status == 'Selesai') return Colors.grey;
    return Colors.red; 
  }

  void _konfirmasiPengembalian(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Konfirmasi Pengembalian'),
        content: Text('Apakah Anda yakin ingin mengembalikan ${daftarPengembalian[index]['title']}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                daftarPengembalian[index]['status'] = 'Diproses';
              });
              Navigator.pop(context);
            },
            child: Text('Ya'),
          ),
        ],
      ),
    );
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
                    "Pengembalian",
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
            ],
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: daftarPengembalian.length,
        itemBuilder: (context, index) {
          final item = daftarPengembalian[index];
          return Container(
            margin: EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.grey[850],
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(12),
              leading: Image.asset(item['image'], width: 50, height: 50, fit: BoxFit.cover),
              title: Text(item['title'], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item['status'], style: TextStyle(color: getStatusColor(item['status'], item['batas']))),
                  Text("Batas: ${item['batas']}", style: TextStyle(color: Colors.white70)),
                ],
              ),
              trailing: item['status'] == 'Belum Dikembalikan'
                  ? ElevatedButton(
                      onPressed: () => _konfirmasiPengembalian(index),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      child: Text("Kembalikan"),
                    )
                  : null,
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.green[400],
        unselectedItemColor: Colors.grey,
        currentIndex: 3, // Set to 3 for Transactions (Monitor Pesanan)
        type: BottomNavigationBarType.fixed,
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
        },
      ),
    );
  }
}