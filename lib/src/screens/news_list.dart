import 'package:flutter/material.dart';
import 'dart:async';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top News'),
        backgroundColor: Color(0xff0ffbff),
      ),
      body: buildList(),
    );
  }

  Widget buildList() {
    return ListView.builder(
      itemCount: 1000,
      itemBuilder: (context, int index) {
        return FutureBuilder(
          future: getFuture(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListTile(title: Text('${snapshot.data} $index'))
                : const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }

  getFuture() {
    return Future.delayed(const Duration(seconds: 2), () => 'hi');
  }
}
