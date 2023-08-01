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
      home:Scaffold(
          appBar: AppBar(title: const Text("Flutter App")),
          body:
              // const HomePage(),
              // const Flexbox()),
              const Flowflex(),
    )
    );
  }
}

//自定义IconContainer
class IconContainer extends StatelessWidget {
  Color color;
  double size;
  IconData icon;
  IconContainer(this.icon,
      {Key? key, this.color = Colors.red, this.size = 32.0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: 60.0,
      color: color,
      child: Center(child: Icon(icon, size: size, color: Colors.white)),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black12,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconContainer(Icons.home),
          IconContainer(
            Icons.search,
            color: Colors.yellow,
          ),
          IconContainer(
            Icons.ac_unit_sharp,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}

class Flexbox extends StatelessWidget {
  const Flexbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(flex: 2, child: IconContainer(Icons.home, color: Colors.red)),
        Expanded(child: IconContainer(Icons.search, color: Colors.orange))
      ],
    );
  }
}

// 流体flex布局
class Flowflex extends StatelessWidget {
  const Flowflex({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          color: Colors.black,
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Image.network(
                  'https://i.postimg.cc/cJ0rhzrR/20230504162838.jpg',
                  fit: BoxFit.cover),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Expanded(
                      flex: 1,
                      child: Image.network(
                          'https://i.postimg.cc/cJ0rhzrR/20230504162838.jpg',
                          fit: BoxFit.cover)),
                  Expanded(
                      flex: 1,
                      child: Image.network(
                          'https://i.postimg.cc/cJ0rhzrR/20230504162838.jpg',
                          fit: BoxFit.cover)),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
