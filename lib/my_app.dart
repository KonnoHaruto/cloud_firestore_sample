import 'package:flutter/material.dart';

import 'view/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'firestore_playground',
      home: HomePage(),
    );
  }
}
