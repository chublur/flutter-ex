// drawer 侧边栏
import 'package:flutter/material.dart';
import 'package:flutterdemo01/animatedList/xianshiAnimation.dart';
import 'package:get/get.dart';
import './pages/tabs.dart';
import './KeepAliveWrapper.dart';
import './stack-btn-card-warp.dart';
import './dialog.dart';
import './pages/pageView.dart';
import './pages/pageViewBuiler.dart';
import './PAGES/pageViewFull.dart';
import './pages/Carousel.dart';
import './animatedList/fadetranstion.dart';
import './animatedList/ScaleTransition.dart';
import './animatedList/animationContainer.dart';
import './key/key.dart';
import './demo/carddemo.dart';
import 'getX/first.dart';
import './layout/layoutbuilder.dart';
import './getX/language.dart';
// 引入语言包
import './getX/message.dart';

// 状态管理
import './pages/state/state.dart';

import './routes/routers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      translations: Messages(),
      locale: const Locale('zh', 'CN'), //设置默认语言
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // 路由
      initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
      home:
          // 状态管理
          // const MyState(),
          // const MyFather(),
          // const BoxA(),
          // const MyLogin(),
      const ResponsiveColumn(children: [],),
      // const MyLanguage(),
      // const CardPerspectiveDemoPage(),
      // const ChangeTheme(),
      // const GlobalPage(),
      // const HomePage(),
      // const XianShi()
      // const Tabs() ,
      // const MyBtm(),
      // const MyTabs(),
      // const MyDialog(),
      // const MyView(),
      // const PageViewBuilder(),
      // const FullPage(),
      // const MyCarousel(),
      // const AnimatedListPage(),
      // const ScaleAnimatedListPage(),
      // const Animate(),
      // routes: {
      //   '/':(context)=>const MyTabs(),
      //   '/animated':(context)=>const Animate()
      // },
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
    _tabController = TabController(length: 3, vsync: this);
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
          bottom: TabBar(controller: _tabController, tabs: const [
            Tab(child: Text("热门")),
            Tab(child: Text("推荐")),
            Tab(child: Text("视频"))
          ]),
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
                    backgroundImage: NetworkImage(
                        "https://i.postimg.cc/rsgStfwy/preview.jpg"),
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
        body: TabBarView(
          controller: _tabController,
          children: const [Text("热门a"), Text("推荐"), Text("视频")],
        ));
  }
}

//  BottomNavigationBar 的页面中使用Tabbar
class MyTabs extends StatefulWidget {
  const MyTabs({super.key});

  @override
  State<MyTabs> createState() => _MyTabsState();
}

class _MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void dispose() {
    //生命周期函数 永久移除组件，并释放资源
    super.dispose();
    _tabController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);
    _tabController.addListener(() {
      if (_tabController.animation!.value == _tabController.index) {
        // ignore: avoid_print
        print(_tabController.index); //获取点击或滑动页面的索引值
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 253, 247, 247),
          elevation: 10,
          title: SizedBox(
            height: 40,
            child: TabBar(
              indicatorColor: Colors.red,
              labelColor: Colors.red,
              unselectedLabelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              controller: _tabController, //注意
              tabs: const [
                Tab(child: Text("热销", style: TextStyle(color: Colors.black))),
                Tab(child: Text("推荐", style: TextStyle(color: Colors.black)))
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          KeepAliveWrapper(
              child: ListView(
            children: const <Widget>[
              ListTile(title: Text("第一个tab")),
              ListTile(title: Text("第一个tab")),
              ListTile(title: Text("第一个tab")),
              ListTile(title: Text("第一个tab")),
              ListTile(title: Text("第一个tab")),
              ListTile(title: Text("第一个tab")),
              ListTile(title: Text("第一个tab")),
              ListTile(title: Text("第一个tab")),
              ListTile(title: Text("第一个tab")),
              ListTile(title: Text("第一个tab")),
              ListTile(title: Text("第一个tab")),
              ListTile(title: Text("第一个tab")),
              ListTile(title: Text("第一个tab")),
              ListTile(title: Text("第一个tab")),
              ListTile(title: Text("第一个tab")),
              ListTile(title: Text("第一个tab")),
              ListTile(title: Text("第一个tab")),
              ListTile(title: Text("第一个tab")),
              ListTile(title: Text("第一个tab")),
              ListTile(title: Text("第一个tab")),
              ListTile(title: Text("最后一个tab")),
            ],
          )),
          KeepAliveWrapper(
              child: ListView(
            children: <Widget>[
              const ListTile(title: Text("第二个tab")),
              const ListTile(title: Text("第二个tab")),
              const ListTile(title: Text("第二个tab")),
              ElevatedButton.icon(
                icon: const Icon(Icons.search),
                label: const Text("search"),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const SearchDemo();
                  }));
                },
              )
            ],
          ))
        ],
      ),
    );
  }
}

// 测试组件用例
class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  TextEditingController unamecontroller = TextEditingController();
  TextEditingController pwdcontroller = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('组件'),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              const TextField(
                autofocus: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.man),
                    labelText: "username",
                    hintText: "please enter your username"),
                textAlign: TextAlign.center,
              ),
              const TextField(
                autofocus: true,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  labelText: "password",
                  hintText: "please enter your password",
                  focusColor: Colors.pink,
                  hoverColor: Colors.pink,
                  //获得焦点下划线设为蓝色
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                ),
              ),
              Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      autofocus: true,
                      controller: unamecontroller,
                      decoration: const InputDecoration(
                        labelText: "用户名",
                        hintText: "用户名或邮箱",
                        icon: Icon(Icons.person),
                      ),
                      // 校验用户名
                      validator: (v) {
                        return v!.trim().isNotEmpty ? null : "用户名不能为空";
                      },
                    ),
                    TextFormField(
                      controller: pwdcontroller,
                      decoration: const InputDecoration(
                        labelText: "密码",
                        hintText: "您的登录密码",
                        icon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                      //校验密码
                      validator: (v) {
                        return v!.trim().length > 5 ? null : "密码不能少于6位";
                      },
                    ),
                    // 登录按钮
                    Padding(
                      padding: const EdgeInsets.only(top: 28.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: ElevatedButton(
                              child: const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text("登录"),
                              ),
                              onPressed: () {
                                // 通过_formKey.currentState 获取FormState后，
                                // 调用validate()方法校验用户名密码是否合法，校验
                                // 通过后再提交数据。
                                if ((formKey.currentState as FormState)
                                    .validate()) {
                                  //验证通过提交数据
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ])));
  }
}



// 进度条