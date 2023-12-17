// ignore_for_file: sized_box_for_whitespace, must_be_immutable

import 'package:flutter/material.dart';

class AuthSocialButtonWidget extends StatelessWidget {
  String pathImage;
  Function()? onTap;
  AuthSocialButtonWidget({super.key, required this.pathImage, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 75,
      child: IconButton(
          style: ButtonStyle(
              backgroundColor: const MaterialStatePropertyAll(Colors.white),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)))),
          onPressed: onTap,
          icon: Image.asset(
            pathImage,
            height: 45,
          )),
    );
  }
}
