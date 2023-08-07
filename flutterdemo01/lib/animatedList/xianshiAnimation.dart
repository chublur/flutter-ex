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
  bool flag = true;
  @override
  void initState() {
    super.initState;
    //Vsync 机制可以理解为是显卡与显示器的通信桥梁，显卡在渲染每一帧之前会等待垂
    // 直同步信号，只有显示器完成了一次刷新时，发出垂直同步信号，显卡才会渲染下一帧，确保刷新率和帧率保
    // 持同步，以达到供需平衡的效果，防止卡顿现象。
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      // lowerBound: 3,
      // upperBound: 5
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          flag ? _controller.forward() : _controller.reverse();
          flag = !flag;
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // RotationTransition(
          //   turns: _controller,
          //   child: const FlutterLogo(
          //     size: 60,
          //   ),
          // ),
          // const SizedBox(
          //   height: 40,
          // ),

          // --------------触发按钮----------------
          // Padding(
          //   padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
          //   child: Wrap(
          //     spacing: 10,
          //     alignment: WrapAlignment.center,
          //     children: [
          //       ElevatedButton(
          //           onPressed: () {
          //             _controller.forward();
          //           },
          //           child: const Text("forward 正序播放")),
          //       ElevatedButton(
          //           onPressed: () {
          //             _controller.reverse();
          //           },
          //           child: const Text("reverse 倒序播放")),
          //       ElevatedButton(
          //           onPressed: () {
          //             _controller.stop();
          //           },
          //           child: const Text("stop 暂停播放")),
          //       ElevatedButton(
          //           onPressed: () {
          //             _controller.reset();
          //           },
          //           child: const Text("reset 重置播放")),
          //       ElevatedButton(
          //           onPressed: () {
          //             _controller.repeat();
          //           },
          //           child: const Text("repeat 重复播放")),
          //     ],
          //   ),
          // ),
          // ----------------FadeTransition------------------
          // FadeTransition(
          //     opacity: _controller,
          //     child: const FlutterLogo(
          //       size: 80,
          //     )),
          // --------SlideTransition----------
          // 这是一负责平移的显示动画组件，使用时需要通过position属性传入一个Animated表示位移程度，通常借助Tween实现。
          // SlideTransition(
          //   position:
          //   // _controller.drive(Tween(
          //   //   begin:const Offset(0, 0),
          //   //   end:const Offset(1.2, 0)  //表示实际的位置向右移动自身宽度的1.2倍
          //   // )),
          //   Tween(
          //     begin:const Offset(0, -1),
          //     end:const Offset(0, 0.8)
          //   ).chain(CurveTween(curve: Curves.bounceIn))
          //   .chain(CurveTween(curve: const Interval(0.8,1.0))) //最后的百分之20的时间完成动画
          //   .animate(_controller),
          //   child: const FlutterLogo(size: 80,),
          //   )

          // AnimatedIcon顾名思义，是一个用于提供动画图标的组件，它的名字虽然是以Animated开头，但是他
          // 是一个显式动画组件，需要通过progress属性传入动画控制器，另外需要由Icon属性传入动画图标数据
          // AnimatedIcon(
          //   icon: AnimatedIcons.home_menu,
          //   progress: _controller,
          //   size: 40,
          // ),
          // AnimatedIcon(
          //   icon: AnimatedIcons.search_ellipsis,
          //   progress: _controller,
          //   size: 40,
          // ),

          // 交错动画
          SlidingBox(
            controller: _controller,
            color: Colors.blue[200],
            curve: const Interval(0, 0.2),
          ),
          SlidingBox(
            controller: _controller,
            color: Colors.blue[400],
            curve: const Interval(0.2, 0.4),
          ),
          SlidingBox(
            controller: _controller,
            color: Colors.blue[600],
            curve: const Interval(0.4, 0.6),
          ),
          SlidingBox(
            controller: _controller,
            color: Colors.blue[800],
            curve: const Interval(0.6, 0.8),
          ),
          SlidingBox(
            controller: _controller,
            color: Colors.blue[900],
            curve: const Interval(0.8, 1.0),
          ),
        ],
      ),
    );
  }
}

class SlidingBox extends StatelessWidget {
  final AnimationController controller;
  final Color? color;
  final Curve curve;
  const SlidingBox(
      {super.key,
      required this.controller,
      required this.color,
      required this.curve});

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween(begin: const Offset(0, 0), end: const Offset(0.3, 0))
          .chain(CurveTween(curve: Curves.linear))
          .chain(CurveTween(curve: curve))
          .animate(controller),
      child: Container(
        width: 220,
        height: 60,
        color: color,
      ),
    );
  }
}
