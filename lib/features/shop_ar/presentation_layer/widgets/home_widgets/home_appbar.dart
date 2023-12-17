import 'package:ar_ecommerce/features/shop_ar/presentation_layer/utils/color_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeAppbar extends StatefulWidget {
  const HomeAppbar({Key? key}) : super(key: key);

  @override
  State<HomeAppbar> createState() => _HomeAppbarState();
}

class _HomeAppbarState extends State<HomeAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: whiteColor),
      leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            size: 48,
          )),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications,
            // color: whiteColor,
            size: 35,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            "assets/images/icons/filter.png",
            color: Colors.white,
            width: 30,
          ),
        ),
        const Gap(10)
      ],
    );
  }
}
