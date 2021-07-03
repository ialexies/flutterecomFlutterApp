import 'package:flutter/material.dart';
import 'package:flutterecom/models/product.dart';
import 'package:flutterecom/widgets/home_hot_product.dart';
import 'home_product_category.dart';

class HomeHotProducts extends StatefulWidget {
  // HomeHotProducts({Key? key}) : super(key: key);
  final List<Product> productList;
  HomeHotProducts({this.productList});

  @override
  _HomeHotProductsState createState() => _HomeHotProductsState();
}

class _HomeHotProductsState extends State<HomeHotProducts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 205,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: this.widget.productList.length,
        itemBuilder: (context, index) {
          return HomeHotProduct(
              this.widget.productList[index].name,
              this.widget.productList[index].photo,
              this.widget.productList[index].price,
              this.widget.productList[index].discount);
        },
      ),
    );
  }
}
