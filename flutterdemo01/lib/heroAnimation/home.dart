import 'package:flutter/material.dart';
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
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}