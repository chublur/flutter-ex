import 'package:flutter/material.dart';
//  Hero 指的是可以在路由(页面)之间“飞行”的 widget，简单来说 Hero 动画就是在路由切换时，有一个共
// 享的widget 可以在新旧路由间切换。

class HeroPage extends StatefulWidget {
  final Map arguments;
  const HeroPage({super.key, required this.arguments});


  @override
  State<HeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("详情页面"),
      ),
      body: ListView(
        children: [
          Hero(
            tag: widget.arguments["imgurl"],  //唯一标记，前后两个路由页Hero的tag必须相同
            child: Image.network(widget.arguments["imgurl"]),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              widget.arguments["age"],
              style: const TextStyle(fontSize: 22),
            ),
          )
        ],
      ),
    );
  }
}
