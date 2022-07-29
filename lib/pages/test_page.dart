
import 'package:flutter/material.dart';
import 'package:sliver_fab/sliver_fab.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Builder(
        builder: (context) =>
         SliverFab(
          floatingWidget: FloatingActionButton(
            onPressed: (){},
            child: const Icon(Icons.add),
          ),
          floatingPosition: const FloatingPosition(right: 16),
          expandedHeight: 256.0,
          slivers: <Widget>[
             SliverAppBar(
              expandedHeight: 256.0,
              pinned: true,
              flexibleSpace:  FlexibleSpaceBar(
                title:  const Text("SliverFab Example"),
                background:  Image.asset(
                  "img.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
             SliverList(
              delegate:  SliverChildListDelegate(
                 List.generate(
                  30,
                      (int index) =>
                   ListTile(title:  Text("Item $index")),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}