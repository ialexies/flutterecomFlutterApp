import 'package:flutter/material.dart';
import 'package:flutterecom/models/product.dart';
import 'package:flutterecom/services/product_service.dart';
import 'package:flutterecom/services/slider_services.dart';
import 'package:flutterecom/services/category_service.dart';
import 'package:flutterecom/models/category.dart';
// import 'package:flutterecom/widgets/app.dart';
import 'dart:convert';

import 'package:flutterecom/widgets/carousel_slider.dart';
import 'package:flutterecom/widgets/home_hot_products.dart';
import 'package:flutterecom/widgets/home_new_products.dart';
import 'package:flutterecom/widgets/home_product_categories.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SliderService _sliderService = SliderService();

  CategoryService _categoryService = CategoryService();
  List<Category> _categorlyList = [];

  ProductService _productService = ProductService();
  List<Product> _productList = [];
  List<Product> _newProductList = [];

  var items = [];

  @override
  void initState() {
    super.initState();
    _getAllSliders();
    _getAllCategories();
    _getAllHotProducts();
    _getNewProducts();
  }

  _getAllSliders() async {
    var sliders = await _sliderService.getSliders();
    var result = json.decode(sliders.body);
    result['data'].forEach((data) {
      setState(() {
        items.add(NetworkImage(
            // 'http://192.168.100.68/flutterecom/public/' + data['image_url']));
            data['image_url']));
      });
    });
    // print(result);
  }

  _getAllCategories() async {
    var categories = await _categoryService.getCategories();
    var result = json.decode(categories.body);

    result['data'].forEach((data) {
      var model = Category();
      model.id = data['id'];
      model.name = data['categoryName'];
      model.icon = data['categoryIcon'];

      setState(() {
        _categorlyList.add(model);
      });
    });
    // print(result);
  }

  _getAllHotProducts() async {
    var hotProducts = await _productService.getHotProducts();
    var result = json.decode(hotProducts.body);

    result['data'].forEach((data) {
      var model = Product();
      model.id = data['id'];
      model.name = data['name'];
      model.photo = data['photo'];
      model.price = data['price'].toDouble();
      model.discount = data['discount'].toDouble();

      setState(() {
        _productList.add(model);
      });
    });
    // print(result);
  }

  _getNewProducts() async {
    var newProducts = await _productService.getNewProducts();
    var result = json.decode(newProducts.body);

    result['data'].forEach((data) {
      var model = Product();
      model.id = data['id'];
      model.name = data['name'];
      model.photo = data['photo'];
      model.price = data['price'].toDouble();
      model.discount = data['discount'].toDouble();

      setState(() {
        _newProductList.add(model);
      });
      // print(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App'),
        // backgroundColor: Colors,
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            carouselSlider(items),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'CATEGORIES',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            HomeProductCategories(
              categoryList: _categorlyList,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'HOT',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            HomeHotProducts(productList: _productList),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'New',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            HomeNewProducts(newProductsList: _newProductList),
          ],
        ),
      ),
    );
  }
}
