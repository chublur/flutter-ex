// 滚动通知
// 监听ListView的滚动通知，然后显示当前滚动进度百分比
import 'package:flutter/material.dart';

class MyNotification extends StatefulWidget {
  const MyNotification({super.key});

  @override
  State<MyNotification> createState() => _MyNotificationState();
}

class _MyNotificationState extends State<MyNotification> {
  String _gropress ="0%"; //保存进度百分比

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("滚动通知，显示百分比"),),
      body: Scrollbar(
        // 接收一个ScrollNotification类型的NotificationListener
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            // 滚动的当前位置，表示从顶部开始已经滚动了多少像素的距离/滚动的最大范围，表示可以滚动的最大距离，通常是整个滚动区域的高度。
            double progress = notification.metrics.pixels / notification.metrics.maxScrollExtent;
            // ignore: avoid_print
            print("BottomEdge: ${notification.metrics.extentAfter == 0}");
            setState(() {
              _gropress = '${(progress*100).toInt()}%';
            });
            return false;
            // return true;
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ListView.builder(itemCount: 100,itemExtent: 100,
                itemBuilder: (context, index) => ListTile(title:Text("$index")),
              ),
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.black54,
                child: Text(_gropress),
                ),
            ],
          ) ,
          
        ),
      ),
    );
  }
}