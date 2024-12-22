import 'package:chatbot/Model/ChatModel.dart';
import 'package:flutter/material.dart';

class CustomUI extends StatefulWidget {
  const CustomUI({super.key,required this.chatModel});
  final ChatModel chatModel;

  @override
  _CustomUIState createState() => _CustomUIState();
}

class _CustomUIState extends State<CustomUI> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Icon(
                Icons.person,
                size: 30,
              ),
              radius: 35,
            ),
            title: Text(
              "Omar Barakeh",
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
                  "Hey Omar",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            trailing: Text("11:11"),
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
