import 'package:flutter/material.dart';
// 我们创建一个ListView，当滚动位置发生变化时，我们先打印出当前滚动位置，然后判断当前位置是否超过1000像素，如果超过则在屏幕右下角显示一个“返回顶部”的按钮，该按钮点击后可以使ListView恢复到初始位置；如果没有超过1000像素，则隐藏“返回顶部”按钮。

class ScrollListener extends StatefulWidget {
  const ScrollListener({super.key});
  @override
  State<ScrollListener> createState() => _ScrollListenerState();
}

class _ScrollListenerState extends State<ScrollListener> {
  final ScrollController _controller = ScrollController();
  // 是否返回顶部状态
  bool backtotop = false;
  @override
  void initState(){
    super.initState();
    // 监听滚动事件
    _controller.addListener((){
      // ignore: avoid_print
      print(_controller.offset);
      if (_controller.offset<1000 && backtotop) {
        setState(() {
          backtotop = false;
        });
      }else if (_controller.offset>=1000&& !backtotop) {
        setState(() {
          backtotop = true;
        });
      }
    });
  }
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("返回顶部")),
      body: Scrollbar(
        child: ListView.builder(
          itemCount: 100,
          itemExtent: 100,
          controller: _controller,
          itemBuilder: (context,index){
            return ListTile(title: Text("$index"));
          }
          ),
      ),
      floatingActionButton: !backtotop?null:FloatingActionButton(
        child:const Icon(Icons.arrow_upward),
        onPressed: (){
          _controller.animateTo(.0, duration:const Duration(milliseconds: 400), curve:Curves.ease);
        },
      ),
    );
  }
}