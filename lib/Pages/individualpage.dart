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
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_back, size: 24),
              SizedBox(width: 5),
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
            SizedBox(width: 10),
            Text(
              widget.chatModel.name,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
