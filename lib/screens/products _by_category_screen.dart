import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterecom/models/product.dart';
import 'package:flutterecom/services/product_service.dart';
import 'package:flutterecom/widgets/product_by_category.dart';

class ProductsByCategoryScreen extends StatefulWidget {
  // const ProductsByCategoryScreen({ Key? key }) : super(key: key);

  final String categoryName;
  final int categoryId;

  ProductsByCategoryScreen({this.categoryName, this.categoryId});

  @override
  _ProductsByCategoryScreenState createState() =>
      _ProductsByCategoryScreenState();
}

class _ProductsByCategoryScreenState extends State<ProductsByCategoryScreen> {
  ProductService _productService = ProductService();
  List<Product> _productListByCategory = [];

  _getProductsByCategory() async {
    var products = await _productService
        .getNewProductsByCategoryid(this.widget.categoryId);

    var _list = json.decode(products.body);

    _list['data'].forEach((data) {
      var model = Product();
      model.id = data['id'];
      model.name = data['name'];
      model.photo = data['photo'].toString();
      model.price = data['price'].toDouble();
      model.discount = data['discount'].toDouble();
      setState(() {
        _productListByCategory.add(model);
      });
    });
    print(products);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getProductsByCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.categoryName),
      ),
      body: Container(
        child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: _productListByCategory.length,
            itemBuilder: (context, index) {
              return ProductByCategory(this._productListByCategory[index]);
            }),
      ),
    );
  }
}
