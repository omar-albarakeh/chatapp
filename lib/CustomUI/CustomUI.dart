import 'package:flutter/material.dart';

class Customui extends StatefulWidget {
  const Customui({super.key});

  @override
  _CustomuiState createState() => _CustomuiState();
}

class _CustomuiState extends State<Customui> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
      ),
      title: Text("omar barakeh",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
      subtitle: Row(
        children: [
          Icon(Icons.done_all,size: 20,color: Colors.blue,),
          SizedBox(width: 10,),
          Text("hey omar",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
        ],
      ),
      trailing: Text("11:11"),
    );
  }
}
