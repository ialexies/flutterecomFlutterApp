import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterecom/screens/product_detail.dart';

class HomeNewProduct extends StatefulWidget {
  // const HomeNewProduct({Key? key}) : super(key: key);

  final String productName;
  final String productPhoto;
  final double productPrice;
  final double productDiscount;
  // final String productBaseurl;

  HomeNewProduct(
    this.productName,
    this.productPhoto,
    this.productPrice,
    this.productDiscount,
  );
  @override
  _HomeNewProductState createState() => _HomeNewProductState();
}

class _HomeNewProductState extends State<HomeNewProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width * 0.5),
      height: 210,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetail(
                        productName: this.widget.productName,
                        productPhoto: this.widget.productPhoto,
                        productPrice: this.widget.productPrice,
                        productDiscount: this.widget.productDiscount,
                      )));
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(this.widget.productName),
                Image.network(
                  widget.productPhoto,
                  // 'http://192.168.100.68/flutterecom/public' + widget.productIcon,
                  // 'http://192.168.100.68/flutterecom/public/13253-png',
                  width: (MediaQuery.of(context).size.width * 0.5),
                  height: 120,
                ),
                Row(
                  children: [
                    Text('Price: ${this.widget.productPrice}'),
                  ],
                ),
                Row(
                  children: [
                    Text('Discount: ${this.widget.productDiscount}'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
