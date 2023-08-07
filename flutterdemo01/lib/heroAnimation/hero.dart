import 'package:flutter/material.dart';

//  Hero 指的是可以在路由(页面)之间“飞行”的 widget，简单来说 Hero 动画就是在路由切换时，有一个共
// 享的widget 可以在新旧路由间切换。

class HeroPage extends StatefulWidget {
  const HeroPage({super.key});

  @override
  State<HeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> with SingleTickerProviderStateMixin {
  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}