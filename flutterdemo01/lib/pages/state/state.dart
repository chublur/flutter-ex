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

// 混合状态管理  在这种情况下，组件自身管理一些内部状态，而父组件管理一些其他外部状态。
// 手指按下时，盒子的周围会出现一个深绿色的边框，抬起时，边框消失。点击完成后，盒子的颜色改变。
class BoxA extends StatefulWidget {
  const BoxA({super.key});

  @override
  State<BoxA> createState() => _BoxAState();
}

class _BoxAState extends State<BoxA> {
  bool _active = false;
  void onChangeState(bool val) {
    setState(() {
      _active = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('混合管理状态'),
      ),
      body: BoxB(
        onChange: onChangeState,
        active: _active,
      ),
    );
  }
}

class BoxB extends StatefulWidget {
  final bool active;
  final ValueChanged<bool> onChange;
  const BoxB({super.key, this.active = false, required this.onChange});

  @override
  State<BoxB> createState() => _BoxBState();
}

class _BoxBState extends State<BoxB> {
  bool hightLight = false;
  void handleTap() {
    setState(() {
      widget.onChange(!widget.active);
    });
  }

  void handleTapUp(TapUpDetails details) {
    setState(() {
      hightLight = false;
    });
  }

  void handleTapDown(TapDownDetails details) {
    setState(() {
      hightLight = true;
    });
  }

  void handleTapcancel() {
    setState(() {
      hightLight = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: handleTapUp,
      onTapDown: handleTapDown,
      onTapCancel: handleTapcancel,
      onTap: handleTap,
      child: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: widget.active ? Colors.blue : Colors.blueGrey,
            border: hightLight
                ? Border.all(color: Colors.cyan.shade300, width: 10)
                : null,
          ),
          child: Center(
            child: Text(
              widget.active ? "active" : "disabled",
              style: const TextStyle(fontSize: 32, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
