import 'package:flutter/material.dart';


// 管理自身状态
class MyState extends StatefulWidget {
  const MyState({super.key});

  @override
  State<MyState> createState() => _MyStateState();
}

class _MyStateState extends State<MyState> {
  bool _active = false;
  @override
  void _handleState(){
    setState(() {
      _active = !_active;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("管理自身状态"),),
      // 监听自身事件
      body: GestureDetector(
        onTap: _handleState,
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(color: _active?Colors.blue:Colors.blueGrey),
            child: Center(
              child: Text(_active?'Active':'Disabled',style:const TextStyle(fontSize: 32,color: Colors.white),),
            ),
          ),
        ),
      ),
    );
  }
}