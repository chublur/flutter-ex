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
              // const Flowflex(),
              // const StackLayout(),
              // const Stackfix(),
              // const AR(),
              // const IdCard(),
              // const MyAvatar(),
              // const MyBtn(),
              // const LayoutDemo(),
              const SearchDemo(),
        ));
  }
}

// 流体flex布局
class Flowflex extends StatelessWidget {
  const Flowflex({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          width: double.infinity,
          height: 200,
          color: Colors.black,
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Expanded(
                flex: 2,
                child: SizedBox(
                  height: 180,
                  child: Image.network(
                      'https://i.postimg.cc/cJ0rhzrR/20230504162838.jpg',
                      fit: BoxFit.cover),
                )),
            Expanded(
                flex: 1,
                // 没规定区域在哪里 会报错
                child: SizedBox(
                  height: 180,
                  child: Column(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Image.network(
                              'https://i.postimg.cc/cJ0rhzrR/20230504162838.jpg',
                              fit: BoxFit.cover)),
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                          flex: 1,
                          child: Image.network(
                              'https://i.postimg.cc/cJ0rhzrR/20230504162838.jpg',
                              fit: BoxFit.cover)),
                    ],
                  ),
                ))
          ],
        )
      ],
    );
  }
}

// 层叠布局（Stack、Align、Positioned）
class StackLayout extends StatelessWidget {
  const StackLayout({super.key});

  @override
  Widget build(BuildContext context) {
    // ---------------stack 简单案例---------------
    // return  Center(
    //   child: Stack(
    //     alignment: Alignment.center,
    //     children: <Widget>[
    //       Container(
    //         height: 200,
    //         width: 200,
    //         color: Colors.red,
    //       ),
    //       const Text('Stack is here',style: TextStyle(fontSize: 15,color: Colors.yellow),)
    //     ],
    //   ),
    // );

    // ---------------align 结合container 使用---------------------------
    // return Container(
    //   height: 150,
    //   width: 150,
    //   color: Colors.blue.shade50,
    //   child: const Align(
    //     alignment: Alignment.bottomRight,
    //     child: FlutterLogo(
    //       size: 60,
    //     ),
    //   ),
    // );

    //---------------------- align 结合 alignment 使用 -----------------------
    // return Container(
    //   height: 150,
    //   width: 150,
    //   color: Colors.blue.shade50,
    //   child: const Align(
    //     alignment: Alignment(1, -1),
    //     child: FlutterLogo(
    //       size: 60,
    //     ),
    //   ),
    // );

    // ------------------- Align结合Stack组件------------------------------------------------
//     return Center(
//       child: Container(
//         height: 400,
//         width: 300,
//         color: Colors.red,
//         child:const Stack(
// // alignment: Alignment.center,
//           children:  <Widget>[
//             Align(
//               alignment: Alignment(1, -0.3),
//               child: Icon(Icons.home, size: 40, color: Colors.white),
//             ),
//             Align(
//               alignment: Alignment.center,
//               child: Icon(Icons.search, size: 30, color: Colors.white),
//             ),
//             Align(
//               alignment: Alignment.bottomRight,
//               child: Icon(Icons.settings_applications,
//                   size: 30, color: Colors.white),
//             )
//           ],
//         ),
//       ),
//     );

    // -----------------stack position-----------------------
    return Container(
      height: 200,
      width: 200,
      color: Colors.blue.shade100,
      child: const Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 150,
            left: 50,
            child: Icon(Icons.home, size: 40, color: Colors.white),
          )
        ],
      ),
    );
  }
}

// Flutter Stack Positioned固定导航案例
class Stackfix extends StatelessWidget {
  const Stackfix({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final width = size.width;
    // final height = size.height;
    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.only(top: 45),
          children: const [
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
            ListTile(
              title: Text("这是一个标题 "),
            ),
          ],
        ),
        Positioned(
          top: 0,
          left: 0,
          height: 60,
          width: size.width,
          child: Container(
            alignment: Alignment.center,
            color: Colors.black,
            child: const Text(
              'hello world',
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}

// AspectRatio的作用是根据设置调整子元素child的宽高比
// 宽高比，最终可能不会根据这个值去布局，具体则要看综合因素，外层是否允许
// 按照这种比率进行布局，这只是一个参考值
class AR extends StatelessWidget {
  const AR({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.yellow,
      child: AspectRatio(
        aspectRatio: 2.0 / 1.0,
        child: Container(
          color: Colors.red.shade100,
        ),
      ),
    );
  }
}

// card 组件
class IdCard extends StatelessWidget {
  const IdCard({super.key});

  @override
  Widget build(BuildContext context) {
    // return ListView(
    //   children: const <Widget>[
    //     Card(
    //       shape:  RoundedRectangleBorder(
    //           borderRadius: BorderRadius.all(Radius.circular(10))),
    //       elevation: 20,
    //       margin:  EdgeInsets.all(10),
    //       child: Column(
    //         children:  <Widget>[
    //           ListTile(
    //             title: Text("张三", style: TextStyle(fontSize: 28)),
    //             subtitle: Text("高级软件工程师"),
    //           ),
    //           Divider(),
    //           ListTile(
    //             title: Text("电话：1213214142"),
    //           ),
    //           ListTile(title: Text("地址：北京市海淀区"))
    //         ],
    //       ),
    //     ),
    //     Card(
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.all(Radius.circular(10)),
    //       ),
    //       elevation: 20,
    //       margin:  EdgeInsets.all(10),
    //       child: Column(
    //         children:  <Widget>[
    //           ListTile(
    //             title: Text("张三", style: TextStyle(fontSize: 28)),
    //             subtitle: Text("高级软件工程师"),
    //           ),
    //           Divider(),
    //           ListTile(
    //             title: Text("电话：1213214142"),
    //           ),
    //           ListTile(title: Text("地址：北京市海淀区"))
    //         ],
    //       ),
    //     )
    //   ],
    // );

    // -------------------Card实现一个图文列表卡片----------------------
    return ListView(
      children: <Widget>[
        Card(
          elevation: 20,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 20 / 9,
                child: Image.network("https://i.postimg.cc/RVM028yp/111.jpg"),
              ),
              ListTile(
                leading: ClipOval(
                  child: Image.network(
                    "https://i.postimg.cc/RVM028yp/111.jpg",
                    fit: BoxFit.cover,
                    width: 60,
                    height: 60,
                  ),
                ),
                title: const Text('chublur'),
                subtitle: const Text('super handsome!'),
              )
            ],
          ),
        ),
      ],
    );
  }
}

//  CircleAvatar实现一个圆形图片
class MyAvatar extends StatelessWidget {
  const MyAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 110,
      backgroundColor: Color.fromARGB(255, 76, 189, 227),
      child: CircleAvatar(
        radius: 100,
        backgroundImage: NetworkImage("https://i.postimg.cc/RVM028yp/111.jpg"),
      ),
    );
  }
}

// 按钮组件
class MyBtn extends StatelessWidget {
  const MyBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 100,
      width: 200,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.send),
        label: const Text('发送'),
      ),
    );
  }
}

// 自定义一个按钮组件
class Button extends StatelessWidget {
  String text;
  void Function()? onPressed;
  Button(this.text, {super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 236, 233, 233)),
          foregroundColor: MaterialStateProperty.all(Colors.black45),
        ),
        child: Text(text));
  }
}

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: <Widget>[
          Button("第1集", onPressed: () {}),
          Button("第2集", onPressed: () {}),
          Button("第3集", onPressed: () {}),
          Button("第4集", onPressed: () {}),
          Button("第5集", onPressed: () {}),
          Button("第6集", onPressed: () {}),
          Button("第7集", onPressed: () {}),
          Button("第8集", onPressed: () {}),
          Button("第9集", onPressed: () {}),
          Button("第10集", onPressed: () {}),
          Button("第11集", onPressed: () {}),
          Button("第12集", onPressed: () {}),
          Button("第13集", onPressed: () {}),
          Button("第14集", onPressed: () {}),
          Button("第15集", onPressed: () {}),
          Button("第16集", onPressed: () {}),
          Button("第17集", onPressed: () {}),
          Button("第18集", onPressed: () {}),
        ],
      ),
    );
  }
}

// warp搜索页面案例
class SearchDemo extends StatelessWidget {
  const SearchDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          Row(
            children: [
              Text(
                "热搜",
                style: Theme.of(context).textTheme.headlineMedium,
              )
            ],
          ),
          const Divider(),
          Wrap(
            spacing: 10,
            runSpacing: 12,
            children: [
              Button("女装", onPressed: () {}),
              Button("笔记本", onPressed: () {}),
              Button("玩具", onPressed: () {}),
              Button("文学", onPressed: () {}),
              Button("女装", onPressed: () {}),
              Button("时尚", onPressed: () {}),
              Button("女装", onPressed: () {}),
              Button("女装", onPressed: () {}),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Text("历史记录", style: Theme.of(context).textTheme.bodyLarge)
            ],
          ),
          const Divider(),
          const Column(
            children: [
              ListTile(
                title: Text("女装"),
              ),
              Divider(),
              ListTile(
                title: Text("笔记本"),
              ),
            ],
          ),
          const SizedBox(height: 100,),
           Padding(
            padding:const EdgeInsets.all(20),
            child: OutlinedButton.icon(
              onPressed: (){},
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black38)
              ),
              icon: const Icon(Icons.delete), 
              label:const Text('清除历史记录'),
              ),
          )
        ],
      ),
    );
  }
}
