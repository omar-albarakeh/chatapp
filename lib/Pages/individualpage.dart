import 'package:chatbot/Model/ChatModel.dart';
import 'package:flutter/material.dart';

class IndividualPage extends StatefulWidget {
  final ChatModel chatModel;
  const IndividualPage({super.key, required this.chatModel});

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Back button with proper alignment
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.arrow_back, size: 24),
            ],
          ),
        ),
        // Title with avatar and name
        title: Row(
          children: [
            CircleAvatar(
              child: Icon(
                widget.chatModel.isGroup ? Icons.people : Icons.person,
                size: 30,
              ),
            ),
            const SizedBox(width: 8), // Spacing between avatar and text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.chatModel.name,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                const Text(
                  "Online", // Status placeholder
                  style: TextStyle(fontSize: 12, color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
        // AppBar actions
        actions: [
          // Phone icon action
          IconButton(
            icon: const Icon(Icons.phone),
            onPressed: () {
              // Add phone call functionality here
              print("Phone icon pressed");
            },
          ),
          // Popup menu button
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle menu item actions
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  child: Text("View Contact"),
                  value: "View Contact",
                ),
                const PopupMenuItem(
                  child: Text("Media"),
                  value: "Media",
                ),
                const PopupMenuItem(
                  child: Text("WhatsApp Web"),
                  value: "WhatsApp Web",
                ),
                const PopupMenuItem(
                  child: Text("Starred Messages"),
                  value: "Starred Messages",
                ),
                const PopupMenuItem(
                  child: Text("Settings"),
                  value: "Settings",
                ),
              ];
            },
          ),
        ],
      ),
      // Page body
      body: Center(
        child: Text(
          "Chat Screen for ${widget.chatModel.name}", // Placeholder text
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

