import 'package:flutter/material.dart';

import '../reference.dart';

class AddingPage extends StatelessWidget {
  const AddingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('sample'),
      ),
      body: Center(
        child: TextField(
          controller: _textController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          contentRef.add({
            "content": _textController.text,
          });
          _textController.clear();
          Navigator.pop(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
