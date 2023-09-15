import 'package:flutter/material.dart';

class CustomScroll extends StatelessWidget {
  const CustomScroll({super.key});

  @override
  Widget build(BuildContext context) {
    // SliverFixedExtentList 是一个 Sliver，它可以生成高度相同的列表项。
    var listView = SliverFixedExtentList(
        itemExtent: 56,
        delegate: SliverChildBuilderDelegate((_, index) => ListTile(title: Text("$index"),),
          childCount: 10
        ),
        
      );
    return Scaffold(
      appBar: AppBar(title: const Text("customscrollview"),),
      body: CustomScrollView(
        slivers: [
          listView,
          listView,
        ],
      ),
    );
  }
}