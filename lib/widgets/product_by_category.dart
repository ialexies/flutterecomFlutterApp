import 'package:flutter/material.dart';
import 'package:flutterecom/models/product.dart';

class ProductByCategory extends StatefulWidget {
  // const ProductByCategory({ Key? key }) : super(key: key);

  final Product product;

  ProductByCategory(this.product);

  @override
  _ProductByCategoryState createState() => _ProductByCategoryState();
}

class _ProductByCategoryState extends State<ProductByCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: 190,
      child: Card(
        child: Column(
          children: <Widget>[
            Text(this.widget.product.name.toString()),
            Text(this.widget.product.price.toString()),
            Image.network(
              this.widget.product.photo,
              // 'http://192.168.100.68/flutterecom/public' + widget.productIcon,
              // 'http://192.168.100.68/flutterecom/public/13253-png',
              width: (MediaQuery.of(context).size.width * 0.5),
              height: 120,
            ),
          ],
        ),
      ),
    );
  }
}
