import 'package:flutter/material.dart';
import 'package:flutterecom/models/product.dart';
import 'package:flutterecom/widgets/home_hot_product.dart';

class HomeNewProducts extends StatefulWidget {
  // const HomeNewProducts({Key? key}) : super(key: key);

  final List<Product> newProductsList;

  HomeNewProducts({this.newProductsList});

  @override
  _HomeNewProductsState createState() => _HomeNewProductsState();
}

class _HomeNewProductsState extends State<HomeNewProducts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 205,
      child: ListView.builder(
          itemCount: this.widget.newProductsList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return HomeHotProduct(
                this.widget.newProductsList[index].name,
                this.widget.newProductsList[index].photo,
                this.widget.newProductsList[index].price,
                this.widget.newProductsList[index].discount);
          }),
    );
  }
}
