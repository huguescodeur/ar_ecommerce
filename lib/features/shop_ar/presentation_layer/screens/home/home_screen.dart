// import 'package:ar_ecommerce/features/shop_ar/domain_layer/usescases/all_product.dart';
// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_controller.dart';
// import 'package:ar_ecommerce/features/shop_ar/presentation_layer/utils/color_screen.dart';
// import 'package:ar_ecommerce/features/shop_ar/presentation_layer/widgets/home_widgets/arrival_card.dart';
// import 'package:ar_ecommerce/features/shop_ar/presentation_layer/widgets/home_widgets/drawer_widget_home.dart';
// import 'package:ar_ecommerce/features/shop_ar/presentation_layer/widgets/home_widgets/search_container_home.dart';
// import 'package:gap/gap.dart';

// import '../../../domain_layer/usescases/auth_domain.dart';
// import '../../../domain_layer/usescases/categrorie_produit.dart';
// import '../../../domain_layer/usescases/collection.dart';
// import '../../../domain_layer/usescases/new_arrival.dart';
// import '../../utils/constants/colors.dart';
// import '../../widgets/home_widgets/banner_widget.dart';
// import '../../widgets/home_widgets/carousel_indicator.dart';
// import '../../widgets/home_widgets/carousel_widget.dart';
// import '../../widgets/home_widgets/home_collection_widget.dart';
// import 'bag_screen.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   CarouselController carouselCtrl = CarouselController();
//   int currentCarousel = 0;

//   final List<BannerWidget> banners = const [
//     BannerWidget(
//       text: "Up To 50% Off",
//       btnText: "Buy Now",
//       backgroundColor: kBlackColor,
//       btnBgColor: kPrimaryColor,
//       textDirection: TextDirection.ltr,
//       imgWidth: 130,
//       titleColor: Colors.white,
//       buttonColor: Colors.white,
//       image: "assets/images/shoe1.png",
//     ),
//     BannerWidget(
//       text: "T-Shirt for Sale",
//       btnText: "Grab Now",
//       backgroundColor: Colors.teal,
//       btnBgColor: Colors.white,
//       textDirection: TextDirection.ltr,
//       imgWidth: 130,
//       titleColor: Colors.white,
//       buttonColor: kPrimaryColor,
//       image: "assets/images/slide-3.png",
//     ),
//     BannerWidget(
//       text: "Cheap Prices",
//       btnText: "Buy Now",
//       backgroundColor: Colors.purpleAccent,
//       btnBgColor: Colors.white,
//       textDirection: TextDirection.ltr,
//       imgWidth: 130,
//       titleColor: Colors.white,
//       buttonColor: Colors.black,
//       image: "assets/images/dress.png",
//     ),
//     BannerWidget(
//       text: "Body Fit Shirt",
//       btnText: "Buy Now",
//       backgroundColor: Colors.brown,
//       btnBgColor: kPrimaryColor,
//       textDirection: TextDirection.ltr,
//       imgWidth: 130,
//       titleColor: Colors.white,
//       buttonColor: Colors.white,
//       image: "assets/images/shirt.png",
//     ),
//   ];

// // ? Liste Nouveau Produit
//   final List<NewProduct> newProducts = [
//     NewProduct(
//       id: 1,
//       name: 'Polo T-Shirt 1 Homme - Blanc',
//       price: 3100,
//       imageAsset: 'assets/images/arrivals/polo-1.jpg',
//     ),
//     NewProduct(
//       id: 2,
//       name:
//           'PRAHO Polo Homme Manches Courtes - Bordeaux/Gris/Blanc Homme - Blanc',
//       price: 3320,
//       imageAsset: 'assets/images/arrivals/praho-polo.jpg',
//     ),
//     NewProduct(
//       id: 3,
//       name: 'Polo Col Mao Pour Homme - Blanc',
//       price: 3330,
//       imageAsset: 'assets/images/arrivals/polo-col-mao.jpg',
//     ),
//     NewProduct(
//       id: 4,
//       name: 'Chemise à Manches Courtes Pour Hommes',
//       price: 2987,
//       imageAsset: 'assets/images/arrivals/chemise-manche-court.jpg',
//     ),

//     NewProduct(
//       id: 5,
//       name: 'Lunette class',
//       price: 2987,
//       imageAsset: 'assets/images/arrivals/arrivals1.png',
//     ),
//     // Add more products as needed
//   ];

//   // ? List Collection Produit
//   final List<CollectionProduct> produitCollection = [
//     CollectionProduct(
//       name: 'Polo T-Shirt 1',
//       imageAsset: 'assets/images/arrivals/polo-1.jpg',
//     ),
//     CollectionProduct(
//       name: 'PRAHO Polo',
//       imageAsset: 'assets/images/arrivals/praho-polo.jpg',
//     ),
//     CollectionProduct(
//       name: 'Polo Col Mao Pour Homme - Blanc ',
//       imageAsset: 'assets/images/arrivals/polo-col-mao.jpg',
//     ),
//     CollectionProduct(
//       name: 'Chemise',
//       imageAsset: 'assets/images/arrivals/chemise-manche-court.jpg',
//     ),

//     CollectionProduct(
//       name: 'Lunette de soleil',
//       imageAsset: 'assets/images/arrivals/arrivals1.png',
//     ),
//     // Add more products as needed
//   ];

//   // ? List Tous Les Produit
//   final List<AllProduct> allProducts = [
//     AllProduct(
//       id: 1,
//       name: 'Gamma shoes with beta brand.',
//       price: 4987,
//       imageAsset: 'assets/images/shoe3_splash.png',
//     ),

//     AllProduct(
//       id: 2,
//       name:
//           'PRAHO Polo Homme Manches Courtes - Bordeaux/Gris/Blanc Homme - Blanc',
//       price: 3320,
//       imageAsset: 'assets/images/arrivals/praho-polo.jpg',
//     ),
//     AllProduct(
//       id: 3,
//       name: 'Polo Col Mao Pour Homme - Blanc',
//       price: 3330,
//       imageAsset: 'assets/images/arrivals/polo-col-mao.jpg',
//     ),
//     AllProduct(
//       id: 4,
//       name: 'Polo T-Shirt 1 Homme - Blanc',
//       price: 3100,
//       imageAsset: 'assets/images/arrivals/polo-1.jpg',
//     ),

//     AllProduct(
//       id: 5,
//       name: 'Lunette class',
//       price: 2987,
//       imageAsset: 'assets/images/arrivals/arrivals1.png',
//     ),
//     AllProduct(
//       id: 6,
//       name: 'white sneaker with adidas logo',
//       price: 5987,
//       imageAsset: 'assets/images/shoe1_splash.png',
//     ),
//     AllProduct(
//       id: 7,
//       name: 'Black Jeans with blue stripes',
//       price: 1987,
//       imageAsset: 'assets/images/pantalon1_splash.png',
//     ),
//     AllProduct(
//       id: 8,
//       name: 'Red shoes with black stripes',
//       price: 2987,
//       imageAsset: 'assets/images/shoe2_splash.png',
//     ),

//     AllProduct(
//       id: 9,
//       name: 'Chemise à Manches Courtes Pour Hommes',
//       price: 2987,
//       imageAsset: 'assets/images/arrivals/chemise-manche-court.jpg',
//     ),

//     AllProduct(
//       id: 10,
//       name: 'Alpha t-shirt for alpha testers.',
//       price: 1187,
//       imageAsset: 'assets/images/tshirt1_splash.png',
//     ),
//     AllProduct(
//       id: 11,
//       name: 'Beta jeans for beta testers',
//       price: 1127,
//       imageAsset: 'assets/images/pantalon2_splash.png',
//     ),
//     AllProduct(
//       id: 12,
//       name: 'V&V  model white t shirts.',
//       price: 1127,
//       imageAsset: 'assets/images/tshirt2_splash.png',
//     ),

//     // Add more products as needed
//   ];

//   List<Category> categories = [
//     Category(name: 'Tous'),
//     Category(name: 'Pantalons'),
//     Category(name: 'T-shirts'),
//   ];

//   AuthServices authServices = AuthServices();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: secondaryColor,
//       drawer: drawerWidget(context: context),
//       appBar: AppBar(
//         backgroundColor: secondaryColor,
//         iconTheme: const IconThemeData(color: whiteColor),
//         leading: Builder(
//           builder: (context) => IconButton(
//             onPressed: () {
//               Scaffold.of(context).openDrawer();
//             },
//             icon: const Icon(
//               Icons.menu,
//               size: 45,
//             ),
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.search,
//               size: 35,
//             ),
//           ),
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.notifications,
//               size: 35,
//             ),
//           ),
//           const Gap(6)
//         ],
//       ),
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         child: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               searchContainerHome(),
//               const SizedBox(height: 10),
//               CarouselWidget(
//                 carouselController: carouselCtrl,
//                 bannerWidget: banners,
//                 onPageChanged: (int index) {
//                   setState(() {
//                     currentCarousel = index;
//                   });
//                 },
//               ),
//               CarouselIndicator(
//                 carouselController: carouselCtrl,
//                 banners: banners,
//                 currentCarousel: currentCarousel,
//               ),
//               Container(
//                 width: double.infinity,
//                 margin: const EdgeInsets.symmetric(horizontal: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text(
//                       'Collection',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     TextButton(
//                       onPressed: () {},
//                       child: Text(
//                         'View All',
//                         style: TextStyle(
//                           color: Colors.red.shade400,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const Gap(10),
//               Container(
//                 height: 200,
//                 width: double.infinity,
//                 margin: const EdgeInsets.only(left: 10, bottom: 20),
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: produitCollection.length,
//                   itemBuilder: (context, index) => collectionWidget(
//                     nameCollection: produitCollection[index].name,
//                     imageCollection: produitCollection[index].imageAsset,
//                   ),
//                 ),
//               ),
//               const Gap(10),
//               Container(
//                 width: double.infinity,
//                 margin: const EdgeInsets.symmetric(horizontal: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text(
//                       'Nouveau Produit',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (context) => const BagScreen(),
//                           ),
//                         );
//                       },
//                       child: Text(
//                         'Voir tous',
//                         style: TextStyle(
//                           color: Colors.red.shade400,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 height: 400,
//                 width: double.infinity,
//                 margin: const EdgeInsets.symmetric(horizontal: 10),
//                 decoration: BoxDecoration(
//                   color: secondaryColor,
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.2),
//                       blurRadius: 6,
//                       offset: const Offset(0, 3),
//                     ),
//                   ],
//                 ),
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: newProducts.length,
//                   itemBuilder: (context, index) => arrivalCard(
//                     context: context,
//                     product: newProducts[index],
//                   ),
//                 ),
//               ),
//               const Gap(25),
//               Container(
//                 width: double.infinity,
//                 margin: const EdgeInsets.symmetric(horizontal: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text(
//                       'Nos produits',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (context) => const BagScreen(),
//                           ),
//                         );
//                       },
//                       child: Text(
//                         'Voir tous',
//                         style: TextStyle(
//                           color: Colors.red.shade400,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               // Container(
//               //   height: 400,
//               //   width: double.infinity,
//               //   margin: const EdgeInsets.symmetric(horizontal: 10),
//               //   decoration: BoxDecoration(
//               //     color: secondaryColor,
//               //     borderRadius: BorderRadius.circular(12),
//               //     boxShadow: [
//               //       BoxShadow(
//               //         color: Colors.black.withOpacity(0.2),
//               //         blurRadius: 6,
//               //         offset: const Offset(0, 3),
//               //       ),
//               //     ],
//               //   ),
//               //   child: GridView.builder(
//               //     physics: const NeverScrollableScrollPhysics(),
//               //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               //       crossAxisCount: 2,
//               //       mainAxisSpacing: 18.0,
//               //       crossAxisSpacing: 40,
//               //       mainAxisExtent: 300,
//               //     ),
//               //     itemCount: allProducts.length,
//               //     itemBuilder: (_, index) {
//               //       return GestureDetector(
//               //         onTap: () {
//               //           // Naviguez vers la page des détails du produit avec allProducts[index]
//               //         },
//               //         child: Container(
//               //           color: Colors.red,
//               //           // height: 80,
//               //         ),
//               //       );
//               //     },
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: avoid_print, sized_box_for_whitespace

import 'package:ar_ecommerce/features/shop_ar/domain_layer/usescases/all_product.dart';
import 'package:ar_ecommerce/features/shop_ar/presentation_layer/provider/favorite_icon_card_provider.dart';
import 'package:ar_ecommerce/features/shop_ar/data_layer/data_product.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:ar_ecommerce/features/shop_ar/domain_layer/usescases/auth_domain.dart';
import 'package:ar_ecommerce/features/shop_ar/domain_layer/usescases/categrorie_produit.dart';
import 'package:ar_ecommerce/features/shop_ar/domain_layer/usescases/collection.dart';
import 'package:ar_ecommerce/features/shop_ar/domain_layer/usescases/new_arrival.dart';
import 'package:ar_ecommerce/features/shop_ar/presentation_layer/utils/color_screen.dart';
import 'package:ar_ecommerce/features/shop_ar/presentation_layer/widgets/home_widgets/arrival_card.dart';
import 'package:ar_ecommerce/features/shop_ar/presentation_layer/widgets/home_widgets/drawer_widget_home.dart';
import 'package:ar_ecommerce/features/shop_ar/presentation_layer/widgets/home_widgets/home_collection_widget.dart';
import 'package:ar_ecommerce/features/shop_ar/presentation_layer/widgets/home_widgets/search_container_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/images.dart';
import '../../widgets/home_widgets/banner_widget.dart';
import '../../widgets/home_widgets/carousel_indicator.dart';
import '../../widgets/home_widgets/carousel_widget.dart';
import 'bag_screen.dart';

// class Product {
//   final String name;
//   final List<Category> categories;

//   Product({required this.name, required this.categories});
// }

// class Category {
//   final String name;

//   Category({required this.name});
// }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselController carouselCtrl = CarouselController();
  int currentCarousel = 0;

  final colors = [100, 200, 300, 400, 500, 600, 700, 800, 900];

  AuthServices authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      drawer: drawerWidget(context: context),
      appBar: AppBar(
        backgroundColor: secondaryColor,
        iconTheme: const IconThemeData(color: whiteColor),
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                size: 45,
              )),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              // color: whiteColor,
              size: 35,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              // color: whiteColor,
              size: 35,
            ),
          ),
          const Gap(6)
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // Your existing code for the search bar
              // ? Container Text Find and Search
              searchContainerHome(),
              const SizedBox(height: 10),

              CarouselWidget(
                carouselController: carouselCtrl,
                bannerWidget: banners,
                onPageChanged: (int index) {
                  setState(() {
                    currentCarousel = index;
                  });
                },
              ),

              CarouselIndicator(
                carouselController: carouselCtrl,
                banners: banners,
                currentCarousel: currentCarousel,
              ),

              // ? Collection Texte
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  // color: Colors.blue,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Collection',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'View All',
                              style: TextStyle(
                                color: Colors.red.shade400,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ))
                      ])),
              const Gap(10),
              // ? Container Collection
              Container(
                height: 200,
                width: double.infinity,
                margin: const EdgeInsets.only(left: 10, bottom: 20),
                // color: Colors.amber,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: produitCollection.length,
                  itemBuilder: (context, index) => collectionWidget(
                      nameCollection: produitCollection[index].name,
                      imageCollection: produitCollection[index].imageAsset),
                ),
              ),
              const Gap(10),
              // ? Text New Arrival
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  // color: Colors.blue,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Nouveau Produit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const BagScreen()));
                            },
                            child: Text(
                              'Voir tous',
                              style: TextStyle(
                                color: Colors.red.shade400,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ))
                      ])),
              const SizedBox(height: 10),
              // ? Container new arrival
              Container(
                height: 400,
                width: double.infinity, // Set the height based on your design
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: newProducts.length,
                  itemBuilder: (context, index) => arrivalCard(
                    context: context,
                    product: NewProduct(
                        id: newProducts[index].id,
                        name: newProducts[index].name,
                        price: newProducts[index].price,
                        imageAsset: newProducts[index].imageAsset),
                  ),
                ),
              ),
              const Gap(20),

              // ? Text New Arrival
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  // color: Colors.blue,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Nos produits',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const BagScreen()));
                            },
                            child: Text(
                              'Voir tous',
                              style: TextStyle(
                                color: Colors.red.shade400,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ))
                      ])),

              Container(
                height: 400,
                margin: const EdgeInsets.only(bottom: 20),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: allProducts.length,
                  // padding: const EdgeInsets.all(16),
                  itemBuilder: (BuildContext context, int index) {
                    // var color = colors[index];
                    return Container(
                      width: 300,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      margin:
                          const EdgeInsets.only(top: 15, right: 15, left: 15),
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
                      child: ListView(
                        // Utilisez un ListView pour éviter le dépassement
                        shrinkWrap: true,
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
                                            allProducts[index].imageAsset,
                                          )))),
                              Positioned(
                                  top: 10,
                                  right: 5,
                                  child: Consumer(
                                    builder: (context, WidgetRef ref, child) {
                                      final favoriteColor =
                                          ref.watch(favoriteColorProvider);

                                      return IconButton(
                                        icon: Icon(
                                          Icons.favorite,
                                          color: favoriteColor,
                                          size: 38,
                                        ),
                                        onPressed: () {
                                          // Toggle the favorite color
                                          ref
                                              .read(favoriteColorProvider
                                                  .notifier)
                                              .update((color) => color ==
                                                      Colors.black
                                                          .withOpacity(0.5)
                                                  ? Colors.red
                                                  : Colors.black
                                                      .withOpacity(0.5));
                                        },
                                      );
                                    },
                                  ))
                            ],
                          ),
                          Container(
                            height: 94,
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  allProducts[index].name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    height: 0,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                Text(
                                  "${allProducts[index].price} FCFA",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                        // Container(
                        //   margin: EdgeInsets.all(8),
                        //   height: 300,
                        //   width: double.infinity,
                        //   color: Colors.amber[color],
                        // )
                        ;
                    // return Container(
                    //   height: 100,
                    //   color: Colors.amber[colorCodes[index]],
                    // );
                  },
                  // separatorBuilder: (context, index) {
                  //   return const Divider(
                  //     // height: 9,
                  //     thickness: 2,
                  //     color: Colors.red,
                  //   );
                  // },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
