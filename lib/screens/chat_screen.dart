import 'package:flutter/material.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView.builder(itemCount: 10,itemBuilder:(context, index) =>
     Container(child: const Text("data"),),));
  }
}