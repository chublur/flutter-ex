import 'package:flutter/material.dart';

// AnimatedList 和 ListView 的功能大体相似，不同的是， AnimatedList 可以在列表中插入或删除节点
// 时执行一个动画，在需要添加或删除列表项的场景中会提高用户体验。

class AnimatedListPage extends StatefulWidget {
  const AnimatedListPage({super.key});

  @override
  State<AnimatedListPage> createState() => _AnimatedListPageState();
}

class _AnimatedListPageState extends State<AnimatedListPage> {
  // 通过 GlobalKey可以获取到 Widget 对应的 Element 从而获取state 。
  final globalkey = GlobalKey<AnimatedListState>();
  List<String> list = ["第一条数据", "第二条数据"];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          list.add("this is a data!");
          globalkey.currentState!.insertItem(list.length - 1);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("fade"),
      ),
      body: AnimatedList(
          key: globalkey,
          initialItemCount: list.length,
          itemBuilder: (context, index, animation) {
            return FadeTransition(
              opacity: animation,
              child: ListTile(
                title: Text(list[index]),
                trailing: const Icon(Icons.delete),
              ),
            );
          }),
    );
  }
}
