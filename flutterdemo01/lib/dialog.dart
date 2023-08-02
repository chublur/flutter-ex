import 'dart:html';

import 'package:flutter/material.dart';
// 引入弹窗库
import 'package:fluttertoast/fluttertoast.dart';

// 引入自定义弹框
import './widget/mydialog.dart';

void main() {
  runApp(const MyApp());
}

// -----------------弹框----------------------
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyDialog(),
    );
  }
}

class MyDialog extends StatefulWidget {
  const MyDialog({super.key});

  @override
  State<MyDialog> createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  // 弹出框
  void _alertDialog() async {
    var result = await showDialog(
        barrierDismissible: false, //点击灰色背景是否使弹框消失 默认为true
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("提示信息！"),
            content: const Text("确定要删除吗？"),
            buttonPadding: const EdgeInsets.all(20),
            actions: [
              TextButton(
                  onPressed: () {
                    // ignore: avoid_print
                    print("ok");
                    Navigator.of(context).pop("ok");
                  },
                  child: const Text("确定")),
              TextButton(
                  onPressed: () {
                    // ignore: avoid_print
                    print("cancel");
                    Navigator.of(context).pop("取消");
                  },
                  child: const Text("取消")),
            ],
          );
        });
    // ignore: avoid_print
    print(result);
  }

  // -----------SimpleDialog -----------
  void _simpleDialog() async {
    var res = await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text("请选择语言"),
          backgroundColor: const Color.fromARGB(255, 184, 202, 211),
          children: [
            SimpleDialogOption(
              onPressed: () {
                // ignore: avoid_print
                print("chinese");
                Navigator.of(context).pop("chinese");
              },
              child: const Text("chinese"),
            ),
            const Divider(),
            SimpleDialogOption(
              onPressed: () {
                // ignore: avoid_print
                print("english");
                Navigator.of(context).pop("english");
              },
              child: const Text("english"),
            ),
            const Divider(),
            SimpleDialogOption(
              onPressed: () {
                // ignore: avoid_print
                print("spanish");
                Navigator.of(context).pop("spanish");
              },
              child: const Text("spanish"),
            ),
          ],
        );
      },
    );
  }

  // -----底部弹框--------
  void _modelBottomSheet() async {
    var res = await showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 220,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListTile(
                  title: const Text("share"),
                  onTap: () {
                    // ignore: avoid_print
                    print("share");
                    Navigator.of(context).pop("share");
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text("follow"),
                  onTap: () {
                    // ignore: avoid_print
                    print("follow");
                    Navigator.of(context).pop("follow");
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text("cancel"),
                  onTap: () {
                    // ignore: avoid_print
                    print("cancel");
                    Navigator.of(context).pop("cancel");
                  },
                ),
              ],
            ),
          );
        });
    // ignore: avoid_print
    print(res);
  }

  // ----浮窗提示信息
  void _toast() {
    Fluttertoast.showToast(
        msg: "流水落花春去也，天上人间",
        toastLength:Toast.LENGTH_LONG, //值针对 android 平台
        gravity: ToastGravity.CENTER, //方位
        timeInSecForIosWeb: 2, //提示时间 针对ios 和 web
        backgroundColor: const Color.fromARGB(255, 188, 71, 71), //背景颜色
        textColor: Colors.white, //文本颜色
        fontSize: 16.0 //文本字体大小
        );
  }

  // 自定义弹框

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("弹窗"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _alertDialog,
              child: const Text('alert弹出框-AlertDialog '),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _simpleDialog,
              child: const Text('select弹出框-SimpleDialog'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _modelBottomSheet,
              child: const Text('ActionSheet底部弹出框'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toast,
              child: const Text('浮窗--Toast'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _MyDialog,
              child: const Text('浮窗--Toast'),
            ),
          ],
        ),
      ),
    );
  }
}
