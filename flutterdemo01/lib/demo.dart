// importm
import 'package:flutter/material.dart';

import './res/listData.dart';

void main() {
  // 加const的好处 是多个相同类型的类可以共享储存空间
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.cyan),
    home: Scaffold(
        appBar: AppBar(title: const Text('gentleman')),
        body: ListView(
          children: const [
            // MyApp(),
            // MyBtn(),
            // Mypic(),
            // Circluarpic(),
            // SizedBox(height: 20),
            // ClipPic(),
            // SizedBox(height: 20),
            // Localpic(),
            // HomeIcon(),
            // MyList(),
            //  Mynewslist(),
            // MyHorizon(),
            // Movelist(),
            // BuildList(),
            // MyGrid(),
            // MygridS(),
            // DynamicGrid(),
            // DynamicGrid2(),
            // GridBuild(),
            Flexrow(),
          ],
        )),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: 100,
        height: 100,
        // transform: Matrix4.translationValues(20, 0, 0),  //位移
        transform: Matrix4.rotationZ(0.45), //旋转
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.pink, //背景颜色
            border: Border.all(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              //配置阴影效果
              BoxShadow(
                  color: Colors.blue, //
                  blurRadius: 20.0),
            ],
            //LinearGradient 背景线性渐变  RadialGradient 径向渐变
            gradient:
                const LinearGradient(colors: [Colors.red, Colors.orange])),
        child: const Text(
          'what the hell',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class MyBtn extends StatelessWidget {
  const MyBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 200,
      height: 40,
      // margin:const EdgeInsets.all(10),
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text(
        '按钮',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}

class Mypic extends StatelessWidget {
  const Mypic({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // ignore: sized_box_for_whitespace
      child: Container(
        width: 300,
        height: 300,
        margin: const EdgeInsets.fromLTRB(0, 40, 0, 40),
        decoration: const BoxDecoration(
          color: Colors.pink,
        ),
        child: Image.network(
          'https://i.postimg.cc/59HFNV1K/screen-image-city-209a8285.jpg',
          // fit:BoxFit.fitHeight,  //填充图片
          repeat: ImageRepeat.repeat,
        ),
      ),
    );
  }
}

// container实现圆形图片  borderradius
class Circluarpic extends StatelessWidget {
  const Circluarpic({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(100),
        image: const DecorationImage(
            image: NetworkImage('https://i.postimg.cc/qBQbxpyB/preview.jpg'),
            fit: BoxFit.cover),
      ),
    );
  }
}

//ClipOval实现圆形图片
class ClipPic extends StatelessWidget {
  const ClipPic({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: Image.network(
          'https://i.postimg.cc/qBQbxpyB/preview.jpg',
          fit: BoxFit.cover,
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}

// 加载本地图片
class Localpic extends StatelessWidget {
  const Localpic({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Image.asset(
        "/images/cat.jpg",
        fit: BoxFit.cover,
      ),
    );
  }
}

// flutter 官方图标组件 https://fonts.google.com/icons
class HomeIcon extends StatelessWidget {
  const HomeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 20),
        Icon(Icons.home, size: 40, color: Colors.pink),
        SizedBox(height: 20),
        Icon(Icons.settings, size: 40, color: Colors.red),
      ],
    );
  }
}

// 垂直列表 ListView
class MyList extends StatelessWidget {
  const MyList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true, //内容适配
      children: const <Widget>[
        ListTile(
          title: Text("list one"),
          leading: Icon(Icons.assessment, color: Colors.red),
        ),
        Divider(color: Colors.grey),
        ListTile(
          title: Text("list one"),
          leading: Icon(Icons.assessment, color: Colors.red),
        ),
        Divider(color: Colors.grey),
        ListTile(
          title: Text("list one"),
          leading: Icon(Icons.assessment, color: Colors.red),
        ),
        Divider(color: Colors.grey),
        ListTile(
          title: Text("list one"),
          leading: Icon(Icons.assessment, color: Colors.red),
        ),
        Divider(color: Colors.grey),
        ListTile(
          title: Text("list one"),
          leading: Icon(Icons.assessment, color: Colors.red),
        ),
        Divider(color: Colors.grey),
        ListTile(
          title: Text("list one"),
          leading: Icon(Icons.assessment, color: Colors.red),
        ),
        Divider(color: Colors.grey),
        ListTile(
          title: Text("list one"),
          leading: Icon(Icons.assessment, color: Colors.red),
        ),
        Divider(color: Colors.grey),
        ListTile(
          title: Text("list one"),
          leading: Icon(Icons.assessment, color: Colors.red),
        ),
        Divider(color: Colors.grey),
        ListTile(
          title: Text("list one"),
          leading: Icon(Icons.assessment, color: Colors.red),
        ),
        Divider(color: Colors.grey),
        ListTile(
          title: Text("list one"),
          leading: Icon(Icons.assessment, color: Colors.red),
        ),
        Divider(color: Colors.grey),
        ListTile(
          title: Text("list one"),
          leading: Icon(Icons.assessment, color: Colors.red),
        )
      ],
    );
  }
}

class Mynewslist extends StatelessWidget {
  const Mynewslist({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        ListTile(
          leading: Image.network(
            "https://i.postimg.cc/3JsX5p8t/preview.jpg",
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          title: const Text('华北黄淮高温雨今起强势登场'),
          subtitle: const Text("中国天气网讯 21日开始，华北黄淮高温雨今起强势登场"),
        ),
        const Divider(), //下划线
        const ListTile(
          leading: CircleAvatar(
              backgroundImage:
                  NetworkImage("https://i.postimg.cc/3JsX5p8t/preview.jpg")),
          title: Text('保监局50天开32罚单 “断供”违规资金为房市降温'),
          subtitle: Text("中国天气网讯 保监局50天开32罚单 “断供”违规资金为房市降温"),
        ),
        const Divider(),
        ListTile(
            title: const Text('华北黄淮高温雨今起强势登场'),
            subtitle: const Text("中国天气网讯 21日开始，华北黄淮高温雨今起强势登场"),
            trailing: Image.network(
              "https://i.postimg.cc/3JsX5p8t/preview.jpg",
              width: 80,
              height: 80,
            )),
        const Divider(),
        ListTile(
          leading: Image.network(
            "https://i.postimg.cc/3JsX5p8t/preview.jpg",
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          title: const Text('普京现身俄海军节阅兵：乘艇检阅军舰'),
        ),
        const Divider(),
        ListTile(
          leading: Image.network(
            "https://i.postimg.cc/3JsX5p8t/preview.jpg",
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          title: const Text('鸿星尔克捐1个亿帮助困难残疾群体 网友：企业有担当'),
        ),
        const Divider(),
        ListTile(
          leading: Image.network(
            "https://i.postimg.cc/3JsX5p8t/preview.jpg",
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          title: const Text('行业冥灯？老罗最好祈祷苹果的AR能成'),
        ),
      ],
    );
  }
}

// 水平列表 可以左右拖动
class MyHorizon extends StatelessWidget {
  const MyHorizon({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      // child: ListView(
      //   scrollDirection: Axis.horizontal,
      //   children: <Widget>[
      //     Container(
      //       width: 180,
      //       color: Colors.red,
      //     ),
      //     Container(
      //       width: 180,
      //       color: Colors.orange,
      //       child: Column(
      //         children: <Widget>[
      //           Image.network("https://i.postimg.cc/3JsX5p8t/preview.jpg"),
      //           const Text('我是一个文本')
      //         ],
      //       ),
      //     ),
      //     Container(
      //       width: 180,
      //       color: Colors.blue,
      //     ),
      //     Container(
      //       width: 180,
      //       color: Colors.deepOrange,
      //     ),
      //     Container(
      //       width: 180,
      //       color: Colors.deepPurpleAccent,
      //     ),
      //   ],
      // ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 180,
            color: Colors.red,
          ),
          Container(
            width: 180,
            color: Colors.blue,
            child: Column(
              children: <Widget>[
                Image.network('https://i.postimg.cc/3JsX5p8t/preview.jpg'),
                const Text('sdasda')
              ],
            ),
          ),
          Container(
            width: 180,
            color: Colors.green,
          ),
          Container(
            width: 180,
            color: Colors.grey,
          ),
          Container(
            width: 180,
            color: Colors.pink,
          ),
        ],
      ),
    );
  }
}

// 动态列表组件
class Movelist extends StatelessWidget {
  const Movelist({super.key});
  // 自定义方法
  List<Widget> initData() {
    List<Widget> list = [];
    for (var i = 0; i < 28; i++) {
      list.add(ListTile(
        title: Text(
          // ignore: unnecessary_brace_in_string_interps
          "i am a data ${i}"
        ),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: initData(),
    );
  }
}

// ListView.builder实现动态列表
class BuildList extends StatelessWidget {
  const BuildList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listData.length,
      shrinkWrap: true,
      itemBuilder: (context, i) {
        return ListTile(
          leading: Image.network(listData[i]['imgUrl']),
          title: Text(listData[i]['title']),
          subtitle: Text(listData[i]['age']),
        );
      },
    );
  }
}

// gridview 网格布局 GridView.count GridView.extent GridView.builder实现动态局
class MyGrid extends StatelessWidget {
  const MyGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 4,
      children: const [
        Icon(Icons.home),
        Icon(Icons.access_alarm_outlined),
        Icon(Icons.zoom_in_map_outlined),
        Icon(Icons.ad_units_rounded),
        Icon(Icons.accessible_forward_outlined),
        Icon(Icons.add_to_home_screen_sharp),
        Icon(Icons.abc_sharp),
        Icon(Icons.work_history_outlined),
        Icon(Icons.wb_sunny_rounded),
      ],
    );
  }
}

class MygridS extends StatelessWidget {
  const MygridS({super.key});

  @override
  Widget build(BuildContext context) {
    return  GridView.extent(
      shrinkWrap: true,
      maxCrossAxisExtent: 200,  //横轴子元素的最大长度
      childAspectRatio: 1,     //子Widget宽高比例
      children:const <Widget>[
        Icon(Icons.home),
        Icon(Icons.ac_unit),
        Icon(Icons.search),
        Icon(Icons.settings),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.circle),
      ],
    );
  }
}

// 动态数据渲染网格布局
class DynamicGrid extends StatelessWidget {
  const DynamicGrid({super.key});
  List<Widget> _initGrid(){
    List<Widget> list =[];
    for (var i = 0; i < 12; i++) {
      list.add(
        Container(
          alignment: Alignment.center,
          color: Colors.blueGrey,  //背景颜色
          child: Text("这是第${i+1}条数据",style:const TextStyle(fontSize: 15,color: Colors.white),),

        )
      );
    }
    return list;
  }
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      padding:const EdgeInsets.all(10),
      crossAxisCount: 3,
      childAspectRatio: 0.8,
      children: _initGrid(),
      );
  }
}

// GridView.count实现动态列表
class DynamicGrid2 extends StatelessWidget {
  const DynamicGrid2({super.key});
  List<Widget> _initGrid2(){
    var templist =listData.map((item) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black26
          ),
        ),
        child: Column(
          children: [
            Image.network(item["imgUrl"],fit: BoxFit.fill,),
            const SizedBox(height: 10,),
            Text(item["title"],style:const TextStyle(fontSize: 20,color: Colors.black87),)
          ],
        ),
      );
    });
    return  templist.toList();
  }
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount:2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding:const EdgeInsets.all(10),
      childAspectRatio: 0.8,
      children: _initGrid2(),
      );
  }
}

// GridView.builder实现动态列表
class GridBuild extends StatelessWidget {
  const GridBuild({super.key});
  Widget _getListData(context,index){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(233, 233, 233, 0.9),width: 1),
      ),
      child: Column(
        children: <Widget>[
          Image.network(listData[index]['imgUrl']),
          const SizedBox(height: 12,),
          Text(listData[index]['title'],textAlign: TextAlign.center,style:const TextStyle(fontSize: 20),),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap:true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10, crossAxisSpacing: 10), 
      itemCount: listData.length,
      itemBuilder: _getListData,

      );
  }
}



//自定义IconContainer
class IconContainer extends StatelessWidget {
  final Color color;
  final IconData icon;
  const IconContainer(this.icon, {Key? key, this.color = Colors.red})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 100,
      width: 100,
      color: color,
      child: Icon(icon, color: Colors.white, size: 28),
    );
  }
}

// 线性布局 row
class Flexrow extends StatelessWidget {
  const Flexrow({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black12,
      child:const Column(  //外部没有Container 行是自适应的
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconContainer(Icons.home),
          IconContainer(Icons.search,color: Colors.yellow,),
          IconContainer(
            Icons.ac_unit_sharp,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}


// 截止到这--------------------------------





