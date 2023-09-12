// 无限列表
import "package:flutter/material.dart";
import 'package:english_words/english_words.dart';
import 'package:flutter/rendering.dart';

class InfiniteList extends StatefulWidget {
  const InfiniteList({super.key});

  @override
  State<InfiniteList> createState() => _InfiniteListState();
}

class _InfiniteListState extends State<InfiniteList> {
  static const loadingTag = "##loading##";  //表尾标记
  final _words = <String>[loadingTag];
  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("无限列表"),
      ),
      body: ListView.separated(
        itemCount: _words.length,
        itemBuilder: (context, index){
          // 如果到了表尾
          if(_words[index]==loadingTag){
            // 不足100 则继续获取
            if(_words.length-1 <100){
              // 获取数据
              _retrieveData();
              // 加载时显示loading
              return Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.center,
                child:const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2.0),
                ),
              );
            }else {
              // 已经加载100 不再获取
              return Container(
                alignment: Alignment.center,
                padding:const EdgeInsets.all(16),
                child:const Text("not more!",style: TextStyle(color: Colors.grey),),
              );
            }
          }
            return ListTile(title: Text(_words[index]));
        } ,
        separatorBuilder: (context, index) =>const Divider(height: .0,),
      ),
    );
  }

  void _retrieveData() {
    Future.delayed(const Duration(seconds: 2)).then((e) {
      setState(() {
        _words.insertAll(
          _words.length - 1,
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList(),
        );
      });
    });
  }
}
