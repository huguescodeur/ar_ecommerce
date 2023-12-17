import 'package:flutter/material.dart';

Widget collectionWidget({required nameCollection, required imageCollection}) {
  return Stack(
    children: [
      Container(
        width: 150,
        height: 200,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(
              imageCollection,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
        // top: 10,
        // right: 10,
        bottom: 0,
        child: Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              nameCollection,
              textAlign: TextAlign.center,
              // maxLines: 2,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      )
    ],
  );
}
