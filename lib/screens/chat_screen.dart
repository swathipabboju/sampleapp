import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView.builder(itemCount: 10,itemBuilder:(context, index) =>
     const Text("data"),
     ),
     floatingActionButton: FloatingActionButton(onPressed: (){
      print("object");
      FirebaseFirestore.instance.collection("chats/6HUD5aPreo9uW25RIccc/messages").snapshots().listen((event) {
        print("event ${event.docs[0]['text']}");
        
        /* event.docs.forEach((element) {
          // print("object");
           print(element['text']);
        }
        ); */
      });

     }),
     );
  }
}