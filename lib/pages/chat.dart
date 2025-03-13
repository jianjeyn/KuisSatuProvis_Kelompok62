import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Chat",
            style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[900],
        iconTheme: IconThemeData(color: Colors.white), // Warna icon (Back Button)
      ),
      body: Column(
        children: [
          // Daftar Chat (Dummy)
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: const [
                ChatBubble(isSender: false, message: "Halo! Ada yang bisa dibantu?"),
                ChatBubble(isSender: true, message: "Iya, saya ingin bertanya tentang produk."),
                ChatBubble(isSender: false, message: "Tentu, silakan tanyakan :)"),
              ],
            ),
          ),

          // Input Chat (Dummy)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              border: const Border(
                top: BorderSide(color: Colors.grey),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Ketik pesan...",
                      border: InputBorder.none,
                    //   color: Colors.white,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.green[800]),
                  onPressed: () {}, // Tidak ada fungsi (dummy)
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget Chat Bubble
class ChatBubble extends StatelessWidget {
  final bool isSender;
  final String message;

  const ChatBubble({super.key, required this.isSender, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSender ? Colors.green[900] : Colors.grey[800],
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(15),
            topRight: const Radius.circular(15),
            bottomLeft: isSender ? const Radius.circular(15) : Radius.zero,
            bottomRight: isSender ? Radius.zero : const Radius.circular(15),
          ),
        ),
        child: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
