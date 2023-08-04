import 'dart:async';

import 'package:flutter/material.dart';

class MyCarousel extends StatefulWidget {
  const MyCarousel({super.key});

  @override
  State<MyCarousel> createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  List<String> imglist = [];
  @override
  void initState() {
    super.initState();
     imglist = const [
      "https://i.postimg.cc/qq4pCBT9/preview.jpg",
      "https://i.postimg.cc/L8n2P0c6/20230414163348.jpg",
      "https://i.postimg.cc/zfTmSm05/20230420090218.jpg",
      "https://i.postimg.cc/Z5rjwTtf/640-21.jpg"
    ];
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("轮播图"),
      ),
      body: ListView(
        children: [Swiper(list: imglist)],
      ),
    );
  }
}


// swiper组件
class Swiper extends StatefulWidget {
  final double width;
  final double height;
  final List<String> list;
  const Swiper(
      {super.key,
      this.width = double.infinity,
      this.height = 400,
      required this.list});

  @override
  State<Swiper> createState() => _SwiperState();
}

class _SwiperState extends State<Swiper> {
  int currentIndex = 0;
  List<Widget> pageList = [];
  late PageController _pageController;
  late Timer timer;
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.list.length; i++) {
      pageList.add(
        PicturePage(width: widget.width, height: widget.height, url:widget.list[i] )
      );
    }
    //PageController
    _pageController = PageController(initialPage: 0);

    timer = Timer.periodic(const Duration(seconds: 5), (t) {
      _pageController.animateToPage((currentIndex + 1) % pageList.length,
          duration: const Duration(milliseconds: 200), curve: Curves.linear);
    });
  }
   @override
  void dispose() {
    super.dispose();
    timer.cancel();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 400,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index % (pageList.length);
              });
            },
            itemCount: 10000,
            itemBuilder: (context, index) {
              return pageList[index % (pageList.length)];
            },
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(pageList.length, (index) {
                return Container(
                  margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == index ? Colors.blue : Colors.grey,
                  ),
                );
              }).toList(),
            ))
      ],
    );
  }
}


// 图片页面组件
class PicturePage extends StatelessWidget {
  final String url;
  final double height;
  final double width;
  const PicturePage({super.key,required this.url,
      this.height = 400,
      this.width = double.infinity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: Image.network(
        url,
        fit: BoxFit.cover,
      ),
    );
  }
}
