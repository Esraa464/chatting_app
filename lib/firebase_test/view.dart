import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        builder: (context, snapshot) {
          // final docs = snapshot.data!.docs;
          return ListView.builder(
            itemBuilder: (context, index) => Container(
                // child: Text(docs[index]['text']),
                ),
            // itemCount: docs.length,
          );
        },
        stream: FirebaseFirestore.instance
            .collection('chats/GlUawa6v55kVmuH02jjG/messages')
            .snapshots(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseFirestore.instance
              .collection('chats')
              .snapshots()
              .listen((event) {
            // print(event.docs[0]['text']);
            event.docs.forEach((element) {
              print(element['text']);
            });
            // for (var element in event.docs) {
            //   print(element['text']);
            // }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
