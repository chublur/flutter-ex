import 'dart:async';

import 'package:flutter/material.dart';

// AnimatedList 和 ListView 的功能大体相似，不同的是， AnimatedList 可以在列表中插入或删除节点
// 时执行一个动画，在需要添加或删除列表项的场景中会提高用户体验。

class ScaleAnimatedListPage extends StatefulWidget {
  const ScaleAnimatedListPage({super.key});

  @override
  State<ScaleAnimatedListPage> createState() => _ScaleAnimatedListPageState();
}

class _ScaleAnimatedListPageState extends State<ScaleAnimatedListPage> {
  // 通过 GlobalKey可以获取到 Widget 对应的 Element 从而获取state 。
  final globalkey = GlobalKey<AnimatedListState>();
  bool flag = true;
  List<String> list = ["第一条数据", "第二条数据"];
  @override
  void initState() {
    super.initState();
  }

  Widget _buildItem(context, index) {
    return ListTile(
      title: Text(list[index]),
      trailing: const Icon(Icons.delete),
      // 点击时能够删除
      onTap: () => _deleteItem(context, index),
    );
  }

  _deleteItem(context, index) {
    if (flag == true) {
      flag = false;
      // ignore: avoid_print
      print(index);
      //注意：删除后需要重新setState
      setState(() {
        // 删除过程执行的是反向动画，animation.value 会从1变为0
        globalkey.currentState!.removeItem(index, (context, animation) {
          //注意先build然后再去删除
          var item = _buildItem(context, index);
          list.removeAt(index);
          return FadeTransition(
            opacity: animation,
            child: item,
          );
        }, duration: const Duration(milliseconds: 500));
      });
      //解决快速删除bug 重置flag
      const timeout = Duration(milliseconds: 600);
      Timer.periodic(timeout, (timer) {
        flag = true;
        timer.cancel();
      });
    }
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
            return ScaleTransition(
              scale: animation,
              child: _buildItem(context, index),
            );
          }),
    );
  }
}
