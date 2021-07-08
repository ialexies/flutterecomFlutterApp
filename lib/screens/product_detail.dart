import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  // const ProductDetail({ Key? key }) : super(key: key);

  final String productName;
  final String productPhoto;
  final double productPrice;
  final double productDiscount;

  ProductDetail(
      {this.productName,
      this.productPhoto,
      this.productPrice,
      this.productDiscount});

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.productName),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 200,
            child: GridTile(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Container(
                  child: Image.network(this.widget.productPhoto),
                ),
              ),
              footer: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                  child: ListTile(
                    leading: Text(
                      this.widget.productName,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    title: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            '${this.widget.productPrice - this.widget.productDiscount}',
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${this.widget.productPrice}',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('Add to Cart'),
              TextButton(
                  onPressed: () {},
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border),
                    color: Colors.redAccent,
                  ))
            ],
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: ListTile(
              title: Text(
                'Product Detail',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text(
                  'Quis sint ex tempor laborum cillum esse tempor aliqua minim. Consectetur tempor magna sunt pariatur est. Nostrud ea dolore est aliquip elit elit ullamco exercitation. Commodo laborum mollit aliqua culpa sint pariatur duis nisi.'),
            ),
          )
        ],
      ),
    );
  }
}
