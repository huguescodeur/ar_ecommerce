import 'package:ar_ecommerce/features/shop_ar/presentation_layer/utils/color_screen.dart';
import 'package:flutter/material.dart';

Widget homeSearch() {
  return Row(
    children: [
      Flexible(
        flex: 1,
        child: Container(
          height: 55,
          // color: Colors.red,
          child: TextField(
            cursorColor: Colors.grey,
            style: const TextStyle(fontSize: 22),
            decoration: InputDecoration(
                filled: true,
                fillColor: whiteOpacity,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                hintText: "Search",
                hintStyle: const TextStyle(fontSize: 20),
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      size: 40,
                      // color: Colors.grey,
                    ))),
          ),
        ),
      )
    ],
  );
}
