import 'package:flutter/material.dart';
import 'package:flutterdemo01/res/listData.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class HeroPage extends StatefulWidget {
  final Map arguments;
  const HeroPage({super.key, required this.arguments});

  @override
  State<HeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  late List listData =[];
  late int initialPage = 0;
  @override
  void initState(){
    super.initState();
    listData = widget.arguments["listData"];
    initialPage = widget.arguments["initialPage"]-1;
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Hero(
        tag: widget.arguments["imgUrl"],
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
          //   child: AspectRatio(
          //       aspectRatio: 16 / 9,
          //       child:
          //           //  PhotoView(
          //           //   imageProvider: NetworkImage(widget.arguments["imgUrl"]),
          //           // ),

          //           // -----------单张图片的预览---------
          //           // PhotoViewGallery.builder(itemCount: 5, builder: ((context,index){
          //           //   return PhotoViewGalleryPageOptions(imageProvider: NetworkImage(listData[index]["imgUrl"]));
          //           // }))

          // ),
          child: PhotoViewGallery.builder(
          itemCount: listData.length,
          pageController: PageController(initialPage: initialPage),
            builder: ((context,index){
              return PhotoViewGalleryPageOptions(imageProvider: NetworkImage(listData[index]["imgUrl"]));
            }),
          ),
        ),
      ),
      
    ));
  }
}
