import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("chats/6HUD5aPreo9uW25RIccc/messages")
            .snapshots(),
        builder: (context, snapshotstream) {
          if (snapshotstream.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          }

          return ListView.builder(
            itemCount: snapshotstream.data?.docs.length ?? 0,
            itemBuilder: (context, index) {
              var doc = snapshotstream.data?.docs;

              return Text("${doc![index]['text']}");
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        /* FirebaseFirestore.instance
            .collection("chats/6HUD5aPreo9uW25RIccc/messages")
            .add({'text': "button clicked"}); */
             FirebaseFirestore.instance
            .collection("chats/6HUD5aPreo9uW25RIccc/messages")
            .orderBy('text',descending: false);
      }),
    );
  }
}
