import 'package:flutter/material.dart';

// 隐式动画
// 隐式动画中可以通过 duration 配置动画时长、可以通过 Curve （曲线）来配置动画过程
// AnimatedContainer的属性和Container属性基本是一样的，当AnimatedContainer属性改变的时候就
// 会触发动画。

class Animate extends StatefulWidget {
  const Animate({super.key});

  @override
  State<Animate> createState() => _AnimateState();
}

class _AnimateState extends State<Animate> {
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.animation),
            onPressed: () {
              setState(() {
                flag = !flag;
              });
            }),
        appBar: AppBar(
          title: const Text("animatedcontainer demo"),
        ),

        // -----------AnimatedContainer--------------
        // body: Center(
        //   child: AnimatedContainer(
        //     duration: const Duration(milliseconds: 500),
        //     width: flag?100:300,
        //     height:flag?100:300,
        //     color: Colors.blue.shade300,
        //   ),
        // ),

        // -------------AnimatedPadding以及curve属性------------
        // body:AnimatedPadding(
        //   duration: const Duration(milliseconds: 2000),
        //   padding: EdgeInsetsDirectional.fromSTEB(10 , flag?10:500, 0, 0),
        //   curve: Curves.bounceInOut,
        //   child: Container(
        //     width: 100,
        //     height: 100,
        //     color: Colors.red.shade200,
        //   ),
        // ) ,

        // ----------------AnimatedPositioned 位置--------------------
        // body: Stack(
        //   children: [
        //     AnimatedPositioned(
        //       curve: Curves.easeInOut,
        //       duration: const Duration(seconds: 1),
        //       top: flag ? 10:500,
        //       left:flag ? 10:300 ,
        //       child: Container(
        //         width: 60,
        //         height: 60,
        //         color: Colors.blue,
        //       ),
        //     )
        //   ],
        // ),

        // ---------------------AnimatedOpacity 动画透明--------------------
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(
                curve: Curves.linear,
                duration: const Duration(seconds: 1),
                opacity: flag ? 1 : 0,
                child: Container(
                  width: 300,
                  height: 300,
                  color: Colors.deepPurple,
                  alignment: Alignment.center,
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(seconds: 1),
                    style: TextStyle(
                        fontSize: flag ? 20 : 50,
                        color: flag ? Colors.white : Colors.amber),
                    child: const Text("fuck"),
                  ),
                ),
              ),
              AnimatedSwitcher(
                duration: const Duration(seconds: 1),
                child: flag? const  CircularProgressIndicator():Image.network("https://i.postimg.cc/59HFNV1K/screen-image-city-209a8285.jpg",fit: BoxFit.fill,width: 200,height: 200,),
              ),
              AnimatedSwitcher(
                // 通过transitionBuilder改变子元素执行动画
                transitionBuilder: ((child,animation){
                  return ScaleTransition(scale: animation,
                  child: FadeTransition(opacity: animation,child: child),);
                }),
                duration: const Duration(milliseconds: 400),
                child: Text(key: UniqueKey(),flag?"aaaaaa":"dfdfdfdf",style: const TextStyle(fontSize: 30),),
              )
            ],
          ),
        ));
  }
}
