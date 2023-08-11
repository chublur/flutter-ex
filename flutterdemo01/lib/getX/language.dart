import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyLanguage extends StatelessWidget {
  const MyLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("切换语言"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("title".tr),
            const SizedBox(),
            Text('hello'.tr),
            ElevatedButton(
                onPressed: () {
                  var locale = const Locale('zh', 'CN');
                  Get.updateLocale(locale);
                },
                child: const Text("中文")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  var locale = const Locale('en', 'US');
                  Get.updateLocale(locale);
                },
                child: const Text("英文"))
          ],
        ),
      ),
    );
  }
}
