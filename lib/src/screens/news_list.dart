import 'package:flutter/material.dart';
import 'dart:async';
import '../blocs/stories_provider.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);

    bloc.fetchTopIds();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Top News'),
        backgroundColor: Colors.amberAccent,
      ),
      body: buildList(bloc),
      // body: buildList(),
    );
  }

  Widget buildList(StoriesBloc bloc) {
    return StreamBuilder(
      stream: bloc.topIds,
      builder: (context, AsyncSnapshot<List<int>> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, int index) {
            return ListTile(title: Text('${snapshot.data![index]}'));
          },
        );
      },
    );
  }

  // Widget buildList() {
  //   return ListView.builder(
  //     itemCount: 1000,
  //     itemBuilder: (context, int index) {
  //       return FutureBuilder(
  //         future: getFuture(),
  //         builder: (context, snapshot) {
  //           return snapshot.hasData
  //               ? ListTile(title: Text('${snapshot.data} $index'))
  //               : const Center(child: CircularProgressIndicator());
  //         },
  //       );
  //     },
  //   );
  // }

  // getFuture() {
  //   return Future.delayed(const Duration(seconds: 2), () => 'hi');
  // }
}
