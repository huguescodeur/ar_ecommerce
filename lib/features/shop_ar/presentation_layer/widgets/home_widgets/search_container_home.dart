import 'package:ar_ecommerce/features/shop_ar/presentation_layer/utils/color_screen.dart';
import 'package:ar_ecommerce/features/shop_ar/presentation_layer/widgets/home_widgets/field_search.dart';
import 'package:flutter/material.dart';

Widget searchContainerHome() {
  return Container(
    height: 150,
    width: double.infinity,
    padding: const EdgeInsets.only(top: 17),
    margin: const EdgeInsets.symmetric(horizontal: 14),
    // color: Colors.amber,
    // decoration: const BoxDecoration(color: Colors.amber),
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Trouver vos meilleurs vêtement de \nfaçons amusante ",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: whiteColor,
          ),
        ),
        // ? Home Search
        // homeSearch()
        // Gap(1)
      ],
    ),
  );
}
