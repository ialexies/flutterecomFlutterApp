import 'package:flutter/material.dart';
import 'package:flutterecom/services/slider_services.dart';
import 'package:flutterecom/widgets/app.dart';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SliderService _sliderService = SliderService();

  @override
  void initState() {
    super.initState();
    _getAllSliders();
  }

  _getAllSliders() async {
    var sliders = await _sliderService.getSliders();
    var result = json.decode(sliders.body);
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('eCommerce App'),
        // backgroundColor: Colors,
      ),
      body: Center(
        child: Text('fdf'),
      ),
    );
  }
}
