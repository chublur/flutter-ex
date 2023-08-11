import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/tabs/home.dart';
import '../pages/hero.dart';

class ChangeTheme extends StatefulWidget {
  const ChangeTheme({super.key});

  @override
  State<ChangeTheme> createState() => _ChangeThemeState();
}

class _ChangeThemeState extends State<ChangeTheme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("bottom"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ------Get.bottomSheet  底部弹框-------
              ElevatedButton(
                  onPressed: () {
                    Get.bottomSheet(Container(
                      color: Get.isDarkMode ? Colors.black26 : Colors.white,
                      height: 200,
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(Icons.wb_sunny_outlined,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black87),
                            onTap: () {
                              //切换主题
                              Get.changeTheme(ThemeData.light());
                              Get.back();
                            },
                            title: Text(
                              "白天模式",
                              style: TextStyle(
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black87),
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.wb_sunny,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black87),
                            onTap: () {
                              //切换主题
                              Get.changeTheme(ThemeData.dark());
                              Get.back();
                            },
                            title: Text(
                              "夜晚模式",
                              style: TextStyle(
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black87),
                            ),
                          )
                        ],
                      ),
                    ));
                  },
                  child: const Text("Getx bottomSheet切换主题")),
              // ---------Get.snackbar--------信息弹窗
              ElevatedButton(
                  onPressed: () {
                    Get.snackbar("Snackbar 标题", "欢迎使用Snackbar");
                  },
                  child: const Text("显示 Snackbar")),
              // defaultDialog
              ElevatedButton(
                  onPressed: () {
                    Get.defaultDialog(
                      title: "提示",
                      middleText: "您确定退出登录？",
                      confirm: ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text("确定")),
                      cancel: ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text("取消")),
                    );
                  },
                  child: const Text("显示默认的dialog")),
                  // --------跳转路由---------
              ElevatedButton(onPressed: () async{
                Get.to(const HomePage());
              }, child: const Text("跳转到首页")),
              ElevatedButton(onPressed: () async{
                Get.toNamed("/hero",arguments: {"id":2});
              }, child: const Text("跳转到命名路由hero"))
            ],
          ),
        ));
  }
}
