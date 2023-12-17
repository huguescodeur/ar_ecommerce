import 'package:ar_ecommerce/features/shop_ar/presentation_layer/provider/favorite_icon_card_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

Widget arrivalCard(
    {required nameProduct, required priceProduct, required imageProduct}) {
  return Container(
    width: 300,
    // height: 400, // Adjust the width based on your design
    padding: const EdgeInsets.symmetric(horizontal: 10),
    margin: const EdgeInsets.only(top: 8, right: 30),
    decoration: BoxDecoration(
      color: Colors.grey.withOpacity(0.1),
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      children: [
        Stack(
          children: [
            Container(
                height: 280,
                margin: const EdgeInsets.only(top: 10),
                // width: 280,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          imageProduct,
                        )))),
            Positioned(
                top: 10,
                right: 5,
                child: Consumer(
                  builder: (context, WidgetRef ref, child) {
                    final favoriteColor = ref.watch(favoriteColorProvider);

                    return IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: favoriteColor,
                        size: 38,
                      ),
                      onPressed: () {
                        // Toggle the favorite color
                        ref.read(favoriteColorProvider.notifier).update(
                            (color) => color == Colors.black.withOpacity(0.5)
                                ? Colors.red
                                : Colors.black.withOpacity(0.5));
                      },
                    );
                  },
                ))
          ],
        ),
        Container(
          // color: Colors.amber,
          height: 94,
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                nameProduct,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  height: 0,
                ),
              ),
              // Gap(5),
              Text(
                "$priceProduct FCFA",
                style: const TextStyle(
                    color: Colors.white,
                    // height: 1,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
