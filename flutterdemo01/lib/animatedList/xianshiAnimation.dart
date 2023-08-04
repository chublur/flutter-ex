import 'package:flutter/material.dart';

// 常见的显式动画有RotationTransition、FadeTransition、ScaleTransition、SlideTransition、
// AnimatedIcon。在显示动画中开发者需要创建一个AnimationController，通过AnimationController
// 控制动画的开始、暂停、重置、跳转、倒播等。
class XianShi extends StatefulWidget {
  const XianShi({super.key});

  @override
  State<XianShi> createState() => _XianShiState();
}

class _XianShiState extends State<XianShi> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState (){
    super.initState;
    //Vsync 机制可以理解为是显卡与显示器的通信桥梁，显卡在渲染每一帧之前会等待垂
    // 直同步信号，只有显示器完成了一次刷新时，发出垂直同步信号，显卡才会渲染下一帧，确保刷新率和帧率保
    // 持同步，以达到供需平衡的效果，防止卡顿现象。
    _controller = AnimationController(
      vsync: this,
      duration:const Duration(seconds: 1)
      );
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      // body: ,
    );
  }
}
