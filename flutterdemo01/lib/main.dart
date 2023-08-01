// drawer 侧边栏
import 'dart:math';

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
      home: const MyBtm(),
    );
  }
}

class MyBtm extends StatefulWidget {
  const MyBtm({super.key});
  @override
  State<MyBtm> createState() => _MyBtmState();
}

class _MyBtmState extends State<MyBtm> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
super.initState();
_tabController=TabController(length: 3, vsync: this);
}
@override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar自定义顶部按钮图标、颜色
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade300,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        title: const Text("抓只鱼"),
        centerTitle: true,
        // 右边的图标集
        // actions: <Widget>[
        //   IconButton(onPressed: (){
        //     print("obj");
        //   }, icon:const Icon(Icons.search))
        // ],
        
        // 通常放tabBar，标题下面显示一个 Tab 导航栏
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(child: Text("热门")),
            Tab(child: Text("推荐")),
            Tab(child: Text("视频"))
          ]
          ),
      ),
      // 左侧边栏
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.blue.shade400,
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://i.postimg.cc/0yBJhwwX/screen-image-city-209a8285.jpg"),
                      fit: BoxFit.fill)),
              child: ListView(
                children: const <Widget>[Text("左侧边栏")],
              ),
            ),
            const ListTile(
              title: Text("个人中心"),
              leading: CircleAvatar(child: Icon(Icons.people)),
            ),
            const Divider(),
            const ListTile(
              title: Text("系统设置"),
              leading: CircleAvatar(child: Icon(Icons.settings)),
            )
          ],
        ),
      ),
      // 右侧边栏
      endDrawer: const Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("chublur"),
              accountEmail: Text("Beryl.OHara87@gmail.com"),
              // 用来设置当前用户的头像
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://i.postimg.cc/0yBJhwwX/screen-image-city-209a8285.jpg"),
              ),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://i.postimg.cc/0yBJhwwX/screen-image-city-209a8285.jpg"),
                      fit: BoxFit.fill)),
              // 用来设置当前用户的其他账号的头像
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundImage:
                      NetworkImage("https://i.postimg.cc/rsgStfwy/preview.jpg"),
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://i.postimg.cc/mrc8WW2Y/20230414163348.jpg"),
                ),
              ],
            ),
            ListTile(
              title: Text("个人中心"),
              leading: CircleAvatar(child: Icon(Icons.people)),
            ),
            Divider(),
            ListTile(
              title: Text("系统设置"),
              leading: CircleAvatar(child: Icon(Icons.settings)),
            )
          ],
        ),
      ),

      body:TabBarView(
        controller: _tabController,
        children: const [Text("热门a"), Text("推荐"), Text("视频")],
      )
    );
  }
}
