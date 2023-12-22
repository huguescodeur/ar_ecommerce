import 'package:ar_ecommerce/features/shop_ar/domain_layer/usescases/auth_domain.dart';
import 'package:ar_ecommerce/features/shop_ar/presentation_layer/utils/color_screen.dart';
import 'package:flutter/material.dart';

Widget drawerWidget({required BuildContext context}) {
  AuthServices authServices = AuthServices();
  return Drawer(
    backgroundColor: secondaryColor,
    child: Column(
      children: [
        DrawerHeader(
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
          decoration: BoxDecoration(
            color: secondaryColor,
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.home,
            color: Colors.white,
            size: 32,
          ),
          title: Text(
            'Home',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.home,
            color: Colors.white,
            size: 32,
          ),
          title: Text(
            'About',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
            Icons.home,
            color: Colors.white,
            size: 32,
          ),
          title: Text(
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
