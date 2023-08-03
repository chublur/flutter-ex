// Flutter中的轮动图以及抖音上下滑页切换视频功能等等，这些都可以通过 PageView 轻松实现

// scrollDirection Axis.horizonta水平方向 Axis.vertical锤子方向
// children 配置子元素
// allowImplicitScrolling 缓存当前页面的前后两页
// onPageChanged page改变的时候触发

import 'package:flutter/material.dart';

class MyView extends StatefulWidget {
  const MyView({super.key});

  @override
  State<MyView> createState() => _MyViewState();
}

class _MyViewState extends State<MyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("pageView演示"),
      ),
      body: PageView(
        scrollDirection: Axis.vertical, //垂直方向
        children: [
          Center(
            child: Text("1",style: Theme.of(context).textTheme.headlineLarge,),
          ),
          Center(
            child: Text("11",style: Theme.of(context).textTheme.headlineLarge,),
          ),
          Center(
            child: Text("111",style: Theme.of(context).textTheme.headlineLarge,),
          ),
          Center(
            child: Text("1111",style: Theme.of(context).textTheme.headlineLarge,),
          ),
          Center(
            child: Text("11111",style: Theme.of(context).textTheme.headlineLarge,),
          ),
          Center(
            child: Text("12",style: Theme.of(context).textTheme.headlineLarge,),
          ),
        ],
      ),
    );
  }
}