// ignore_for_file: sized_box_for_whitespace, depend_on_referenced_packages

import 'package:ar_ecommerce/features/shop_ar/presentation_layer/utils/color_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

// import 'package:another_carousel_pro/another_carousel_pro.dart';

final List<String> imgList = [
  'assets/images/banners/banner-1.png',
  'assets/images/banners/banner-2.png',
];

// final themeMode = ValueNotifier(2);

class BagScreen extends StatefulWidget {
  const BagScreen({Key? key}) : super(key: key);

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  @override
  Widget build(BuildContext context) {
    //  child: Container(
    //                 // height: 300,

    //                 width: double.infinity,
    //                 // color: Colors.yellow,
    //                 child: CarouselSlider.builder(
    //                     itemCount: imgList.length,
    //                     itemBuilder: (context, index, realIndex) {
    //                       final urlImage = imgList[index];
    //                       return buildImage(urlImage, index);
    //                     },
    //                     options: CarouselOptions(
    //                         height: 300, viewportFraction: 1.0, autoPlay: true)),
    //               ),
    return Scaffold(
        backgroundColor: secondaryColor,
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: [
                    Container(
                      // height: 300,

                      width: double.infinity,
                      color: Colors.yellow,
                      child: CarouselSlider.builder(
                        itemCount: imgList.length,
                        options: CarouselOptions(
                            viewportFraction: 1.0, height: 400, autoPlay: true),
                        itemBuilder: (context, index, realIndex) {
                          final urlImage = imgList[index];
                          return buildImage(urlImage, index);
                        },
                      ),
                    ),
                    const Positioned(
                      left: 20,
                      bottom: 30,
                      child: Text(
                        "Street clothes",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }

  Widget buildImage(String urlImage, int index) => Container(
        // color: Colors.red,
        width: double.infinity,
        child: Image.asset(
          urlImage,
          fit: BoxFit.cover,
        ),
      );
}
