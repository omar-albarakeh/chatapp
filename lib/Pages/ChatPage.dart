import 'package:chatbot/CustomUI/CustomUI.dart';
import 'package:flutter/material.dart';

class Chatpage extends StatefulWidget {
  const Chatpage({super.key});

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.primaryColor,
        onPressed: (){},
        child: Icon(Icons.chat,color:Colors.white,),
      ),
      body: ListView(
        children: [
          Customui(),
          Customui(),

        ],
      ),
    );
  }
}
