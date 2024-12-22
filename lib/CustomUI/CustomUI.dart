import 'package:chatbot/Model/ChatModel.dart';
import 'package:flutter/material.dart';

class CustomUI extends StatefulWidget {
  const CustomUI({super.key, required this.chatModel});
  final ChatModel chatModel;

  @override
  _CustomUIState createState() => _CustomUIState();
}

class _CustomUIState extends State<CustomUI> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Icon(
                widget.chatModel.isGroup? Icons.people : Icons.person,
                size: 30,
              ),
              radius: 35,
            ),
            title: Text(
              widget.chatModel.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                Icon(
                  Icons.done_all,
                  size: 20,
                  color: Colors.blue,
                ),
                SizedBox(width: 10),
                Text(
                  widget.chatModel.currentMessage,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            trailing: Text(widget.chatModel.time),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(thickness: 1),
          ),
        ],
      ),
    );
  }
}
