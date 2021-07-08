import 'package:flutter/material.dart';
import 'package:flutterecom/models/category.dart';
import 'home_product_category.dart';

class HomeProductCategories extends StatefulWidget {
  // HomeProductCategories({Key? key}) : super(key: key);
  final List<Category> categoryList;
  HomeProductCategories({this.categoryList});

  @override
  _HomeProductCategoriesState createState() => _HomeProductCategoriesState();
}

class _HomeProductCategoriesState extends State<HomeProductCategories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 205,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: this.widget.categoryList.length,
        itemBuilder: (context, index) {
          return HomeProductCategory(
            this.widget.categoryList[index].id,
            this.widget.categoryList[index].icon,
            this.widget.categoryList[index].name,
            this.widget.categoryList[index].baseUrl,
          );
        },
      ),
    );
  }
}
