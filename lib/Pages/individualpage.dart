import 'package:chatbot/Model/ChatModel.dart';
import 'package:flutter/material.dart';

class IndividualPage extends StatefulWidget {
  final ChatModel chatModel;
  const IndividualPage({super.key, required this.chatModel});

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> messages = [];

  void _sendMessage() {
    String message = _controller.text;
    if (message.isNotEmpty) {
      setState(() {
        messages.add({"sender": "me", "message": message});
      });
      _controller.clear();

      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          messages.add({"sender": "receiver", "message": "Received: $message"});
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: Row(
          children: [
            CircleAvatar(
              child: Icon(
                widget.chatModel.isGroup ? Icons.people : Icons.person,
                size: 30,
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.chatModel.name,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                const Text(
                  "Online",
                  style: TextStyle(fontSize: 12, color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.phone),
            onPressed: () {
              print("Phone icon pressed");
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isSender = message["sender"] == "me";
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Align(
                    alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        color: isSender ? Colors.blueAccent : Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        message["message"]!,
                        style: TextStyle(
                          color: isSender ? Colors.white : Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      cursorColor: Colors.blue,
                      decoration: InputDecoration(
                        hintText: "Type a message...",
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        prefixIcon: const Icon(
                          Icons.emoji_emotions,
                          color: Colors.grey,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.file_copy,
                            color: Colors.grey, // Suffix icon color
                          ),
                        ),
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      minLines: 1,
                    )
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.send,
                      color: Colors.blue,
                    ),
                    onPressed: _sendMessage,
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