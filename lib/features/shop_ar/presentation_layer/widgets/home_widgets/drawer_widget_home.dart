// ignore_for_file: avoid_print

import 'package:ar_ecommerce/features/shop_ar/domain_layer/usescases/auth_domain.dart';
import 'package:ar_ecommerce/features/shop_ar/presentation_layer/screens/home/bag_screen.dart';
import 'package:ar_ecommerce/features/shop_ar/presentation_layer/utils/color_screen.dart';
import 'package:ar_ecommerce/features/shop_ar/presentation_layer/screens/product/list_collection.dart';
import 'package:flutter/material.dart';

Widget drawerWidget({required BuildContext context}) {
  AuthServices authServices = AuthServices();
  return Drawer(
    backgroundColor: secondaryColor,
    child: Column(
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: secondaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 10),
              Text(
                'AR Ecommerce',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.home,
            color: Colors.white,
            size: 32,
          ),
          title: const Text(
            'Home',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.shopping_bag_outlined,
            color: Colors.white,
            size: 32,
          ),
          title: const Text(
            'Collections',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ListCollection(),
            ));
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.info_outline,
            color: Colors.white,
            size: 32,
          ),
          title: const Text(
            'About',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(
            Icons.logout,
            color: Colors.white,
            size: 32,
          ),
          title: const Text(
            'Logout',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          onTap: () {
            authServices.logoutUser(context);
            print("Logout");
          },
        ),
      ],
    ),
  );
}
