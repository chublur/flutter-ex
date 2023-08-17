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
  void _handleState() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("管理自身状态"),
      ),
      // 监听自身事件
      body: GestureDetector(
        onTap: _handleState,
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            decoration:
                BoxDecoration(color: _active ? Colors.blue : Colors.blueGrey),
            child: Center(
              child: Text(
                _active ? 'Active' : 'Disabled',
                style: const TextStyle(fontSize: 32, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// --------父Widget管理子Widget的状态-----------
class MyFather extends StatefulWidget {
  const MyFather({super.key});

  @override
  State<MyFather> createState() => _MyFatherState();
}

class _MyFatherState extends State<MyFather> {
  bool _active = false;
  void handleTap(bool newval) {
    setState(() {
      _active = newval;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('父管理子'),
      ),
      body: MySon(
        active: _active,
        onChange: handleTap,
      ),
    );
  }
}

class MySon extends StatelessWidget {
  final bool active;
  // 函数类型的变量 传入值为bool
  final ValueChanged<bool> onChange;
  const MySon({super.key, required this.active, required this.onChange});
  void changeState() {
    onChange(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeState,
      child: Center(
        child: Container(
          width: 200,
          height: 200,
          color: active ? Colors.blue : Colors.blueGrey,
          child: Center(
            child: Text(
              active ? 'active' : 'disabled',
              style: const TextStyle(fontSize: 32, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
