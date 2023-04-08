import 'package:flutter/material.dart';

import 'ui/feed_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 8, 85, 48),
        ),
      ),
      home: const FeedPage(title: 'Flutter Demo Home Page'),
    );
  }
}
