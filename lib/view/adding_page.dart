import 'package:flutter/material.dart';

import '../reference.dart';

class AddingPage extends StatelessWidget {
  const AddingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('sample'),
      ),
      body: Center(
        child: TextField(
          controller: textController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          contentRef.add({
            "content": textController.text,
          });
          textController.clear();
          Navigator.pop(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
