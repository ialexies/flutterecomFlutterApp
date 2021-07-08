import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterecom/screens/products%20_by_category_screen.dart';

class HomeProductCategory extends StatefulWidget {
  // const HomeProductCategory({Key? key}) : super(key: key);
  final int categoryId;
  final String categoryIcon;
  final String categoryName;
  final String categoryBaseurl;

  HomeProductCategory(this.categoryId, this.categoryIcon, this.categoryName,
      this.categoryBaseurl);
  @override
  _HomeProductCategoryState createState() => _HomeProductCategoryState();
}

class _HomeProductCategoryState extends State<HomeProductCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width * 0.5),
      height: 190,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductsByCategoryScreen(
                      categoryName: widget.categoryName,
                      categoryId: widget.categoryId)));
        },
        child: Card(
          child: Column(
            children: <Widget>[
              Image.network(
                widget.categoryIcon,
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
      ),
    );
  }
}
