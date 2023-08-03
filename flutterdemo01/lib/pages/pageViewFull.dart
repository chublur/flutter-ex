import 'package:flutter/material.dart';

// 无限下拉
class FullPage extends StatefulWidget {
  const FullPage({super.key});

  @override
  State<FullPage> createState() => _FullPageState();
}

class _FullPageState extends State<FullPage> {
  final List<Widget> _list = [];
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 10; i++) {
      _list.add(MyPage(text: "$i"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("无限滚屏"),
      ),
      body: PageView(
        scrollDirection: Axis.vertical,
        onPageChanged: (index) {
          
          // ignore: avoid_print
          print(index);
          // ignore: avoid_print
          print(_list.length);
          if (index + 2 == _list.length) {
            setState(() {
              for (var i = 0; i < 10; i++) {
                _list.add(MyPage(text: "$i"));
              }
            });
          }
        },
        children: _list,
      ),
    );
  }
}

class MyPage extends StatefulWidget {
  final String text;
  const MyPage({super.key, required this.text});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          Text(widget.text, style: Theme.of(context).textTheme.headlineLarge),
    );
  }
}
