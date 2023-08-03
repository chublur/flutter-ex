import 'package:flutter/material.dart';

class PageViewBuilder extends StatefulWidget {
  const PageViewBuilder({super.key});

  @override
  State<PageViewBuilder> createState() => _PageViewBuilderState();
}

class _PageViewBuilderState extends State<PageViewBuilder> {
  int itemCount=10;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Center(
          child: Text("${index+1}",style: Theme.of(context).textTheme.headlineLarge,),
        );
      },
      itemCount: itemCount =10 ,
    );
  }
}