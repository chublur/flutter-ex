import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(title: const Text("Flutter App")),
          body:
              const MyCount(),
              
        ));
  }
}

// StatelessWidget是无状态组件，状态不可变的widget
// StatefulWidget是有状态组件，持有的状态可能在widget生命周期改变。

// 通俗的讲：如果我们想改变页面中的数据的话这个时候就需要用到StatefulWidget

// 实现一个计数器
class MyCount extends StatefulWidget {
  const MyCount({super.key});

  @override
  State<MyCount> createState() => _MyCountState();
}

class _MyCountState extends State<MyCount> {
  int countNum = 0;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        children: [
          const SizedBox(height: 40,),
          Text("$countNum",style:Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 40,),
          ElevatedButton.icon(onPressed: (){
            setState(() {
              countNum++;
            });
          }, icon:const Icon(Icons.add), label:const Text("ADD"))
        ],
      ),
    );
  }
}
