// ignore_for_file: avoid_print

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:ar_ecommerce/features/shop_ar/presentation_layer/screens/home/bag_screen.dart';
import 'package:ar_ecommerce/features/shop_ar/presentation_layer/screens/home/favorite_screen.dart';
import 'package:ar_ecommerce/features/shop_ar/presentation_layer/screens/home/home_screen.dart';
import 'package:ar_ecommerce/features/shop_ar/presentation_layer/screens/home/profile_screen.dart';
import 'package:ar_ecommerce/features/shop_ar/presentation_layer/screens/home/shop_screen.dart';
import 'package:ar_ecommerce/features/shop_ar/presentation_layer/utils/color_screen.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  static const String idScreen = "home";

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // final currentUser = FirebaseAuth.instance.currentUser!;
  late PageController pageController;

  // var focusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
    /*focusNode.addListener(() {
      setState(() {});
    });*/
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

  // * Type index
  int selectedPage = 0;
  var _currentIndex = 0;

  void onTappedBar(int index) {
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  // focusNode.hasFocus?null :
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: SalomonBottomBar(
          curve: Curves.linear,
          currentIndex: selectedPage,
          backgroundColor: secondaryColor,
          selectedItemColor: primaryColor,
          unselectedItemColor: greyColor,
          itemShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onTap: onTappedBar,
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.home,
                size: 40,
              ),
              title: const Text("Home"),
              // selectedColor: Colors.purple,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.shopping_cart_outlined,
                size: 40,
              ),
              title: const Text("Shop"),
              // selectedColor: Colors.pink,
            ),

            /// Search
            // SalomonBottomBarItem(
            //   icon: Icon(
            //     Icons.shopping_bag_outlined,
            //     size: 40,
            //   ),
            //   title: Text("Bag"),
            //   // selectedColor: Colors.orange,
            // ),

            /// Profile
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.favorite_border_outlined,
                size: 40,
              ),
              title: const Text("Likes"),
              // selectedColor: Colors.teal,
            ),

            SalomonBottomBarItem(
              icon: const Icon(
                Icons.person_2_outlined,
                size: 40,
              ),
              title: const Text("Profil"),
              // selectedColor: Colors.teal,
            ),
          ],
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: (index) {
            onPageChanged(index);
          },
          children: const [
            HomeScreen(),
            // HomeScreens(),
            ShopScreen(),
            FavoriteScreen(),
            ProfileScreen(),
            BagScreen(),
          ],
        ));
  }
}

/*BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: secondaryColor,
            selectedItemColor: primaryColor,
            unselectedItemColor: greyColor,
            currentIndex: selectedPage,
            onTap: onTappedBar,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 40,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  size: 40,
                ),
                label: "Shop",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  size: 40,
                ),
                label: "Bag",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border_outlined,
                  size: 40,
                ),
                label: "Favorites",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_2_outlined,
                  size: 40,
                ),
                label: "Profile",
              ),
            ]) */
