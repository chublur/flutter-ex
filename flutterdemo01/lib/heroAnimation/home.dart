import 'package:flutter/material.dart';
// import 'package:photo_view/photo_view.dart';
import '../res/listData.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _getListData(){
    var tempList = listData.map((e){
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context,'/hero',
          arguments:{
            "imgurl":e["imgurl"],
            "age":e["age"],
          }
          );
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromRGBO(233, 233, 233, 0.9),width: 1
            ),
          ),
          child: Column(
            children: <Widget>[
              Hero(tag: e['imgurl'], child: Image.network(e['imgurl'])),
              const SizedBox(height: 12),
              Text(
                e['title'],
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      );
    });
    return tempList.toList();
  }
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: 10,  //水平子widget间距
      mainAxisSpacing: 10,  //垂直子widget间距
      padding: const EdgeInsets.all(10),
      crossAxisCount: 2,  //一行的widget数量
      childAspectRatio: 0.7,  //宽高比例,
      children: _getListData(),
    );
  }
}