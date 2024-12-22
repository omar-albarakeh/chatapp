import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "WhatsApp Clone",
          style: TextStyle(color: theme.secondaryHeaderColor),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
                Icons.search),
          ),
          PopupMenuButton(
            onSelected: (value){
              print(value);
            },
              itemBuilder: (BuildContext context){
            return [
              PopupMenuItem(child: Text("New group"),value: "New group",),
              PopupMenuItem(child: Text("New broadcast"),value: "New broadcast",),
              PopupMenuItem(child: Text("Whatsapp Web"),value: "Whatsapp Web",),
              PopupMenuItem(child: Text("started messages"),value: "started messages",),
              PopupMenuItem(child: Text("Settings"),value: "Settings",),

            ];
          })
        ],
        bottom: TabBar(
          controller: _controller,
          tabs:[
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(text: "CHATS"),
            Tab(text: "STATUS"),
            Tab(text: "CALLS"),
          ],
        ),
      ),
      body:TabBarView(
          controller: _controller,
          children: [
            Text("camera"),
            Text("chats"),
            Text("status"),
            Text("Calls"),
          ],
      ) ,
    );
  }
}
