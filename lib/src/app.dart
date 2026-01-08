import 'package:flutter/material.dart';
import 'screens/news_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'News App', home: const NewsList());
  }
}
