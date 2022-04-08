import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/controllers/search.dart';
import '../widgets/searchBar.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(SearchController());

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/sky.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            color: Colors.black38,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Center(
              child: SearchBar(),
            ),
          ),
        ],
      ),
    );
  }
}
