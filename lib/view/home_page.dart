import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../reference.dart';
import 'adding_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _contentStream =
        contentRef.orderBy('content', descending: true).snapshots();

    return Scaffold(
      appBar: AppBar(
        title: const Text('playground'),
      ),
      body: SafeArea(
          child: StreamBuilder(
              stream: _contentStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: Text('Loading...'),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: Text('Loading...'),
                  );
                }
                return ListView(
                  children:
                      snapshot.data!.docs.map((QueryDocumentSnapshot data) {
                    // Map<String, dynamic> data =
                    //     collection.data()! as Map<String, dynamic>;
                    return ListTile(
                      title: Text(data['content']),
                      onLongPress: () {
                        data.reference.delete();
                      },
                    );
                  }).toList(),
                );
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return const AddingPage();
          }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
