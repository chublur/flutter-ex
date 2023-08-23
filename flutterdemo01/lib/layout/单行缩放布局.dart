import 'package:flutter/material.dart';

class SingleLineFittedBox extends StatelessWidget {
  final Widget?child;
  const SingleLineFittedBox({super.key,this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('单行布局'),),
      body: LayoutBuilder(
        builder:(_,constraints){
          return FittedBox(
            child: ConstrainedBox(
              constraints: constraints.copyWith(
                minWidth:constraints.maxWidth,
                maxWidth:double.infinity, //无限宽
              ),
              child: child,
            ),
          );
        } 
        ),
    );
  }
}