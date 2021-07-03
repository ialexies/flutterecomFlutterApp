import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeProductCategory extends StatefulWidget {
  // const HomeProductCategory({Key? key}) : super(key: key);
  final String categoryIcon;
  final String categoryName;
  final String categoryBaseurl;

  HomeProductCategory(
      this.categoryIcon, this.categoryName, this.categoryBaseurl);
  @override
  _HomeProductCategoryState createState() => _HomeProductCategoryState();
}

class _HomeProductCategoryState extends State<HomeProductCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width * 0.5),
      height: 190,
      child: Card(
        child: Column(
          children: <Widget>[
            Image.network(
              widget.categoryIcon,
              // 'http://192.168.100.68/flutterecom/public' + widget.categoryIcon,
              // 'http://192.168.100.68/flutterecom/public/13253-png',
              width: (MediaQuery.of(context).size.width * 0.5),
              height: 140,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(widget.categoryName),
            )
          ],
        ),
      ),
    );
  }
}
