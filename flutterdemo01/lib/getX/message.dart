import 'package:get/get.dart';

// 定义一个语言包
class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': {
          'hello': '你好 世界',
        },
        'de_DE': {
          'hello': 'Hallo Welt',
        }
      };
}
