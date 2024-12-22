import 'package:chatbot/CustomUI/CustomUI.dart';
import 'package:chatbot/Model/ChatModel.dart';
import 'package:flutter/material.dart';

class Chatpage extends StatefulWidget {
  const Chatpage({super.key});

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  List<ChatModel> chats = [
    ChatModel(
      name: "John Doe",
      icon: "person_icon.png",
      isGroup: false,
      time: "10:30 AM",
      currentMessage: "Hello there!",
    ),
    ChatModel(
      name: "Flutter Devs",
      icon: "group_icon.png",
      isGroup: true,
      time: "9:15 AM",
      currentMessage: "Today's topic: State Management",
    ),
    ChatModel(
      name: "Jane Smith",
      icon: "person_icon2.png",
      isGroup: false,
      time: "8:45 AM",
      currentMessage: "Good morning!",
    ),
    ChatModel(
      name: "Family Group",
      icon: "family_icon.png",
      isGroup: true,
      time: "Yesterday",
      currentMessage: "Don't forget the dinner tonight!",
    ),
    ChatModel(
      name: "Work Team",
      icon: "work_icon.png",
      isGroup: true,
      time: "Monday",
      currentMessage: "Meeting scheduled for 3 PM.",
    ),
  ];

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
          CustomUI(),
          CustomUI(),
        ],
      ),
    );
  }
}
