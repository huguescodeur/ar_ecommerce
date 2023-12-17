// ignore_for_file: avoid_print

import 'package:ar_ecommerce/features/shop_ar/domain_layer/usescases/categrorie_produit.dart';
import 'package:ar_ecommerce/features/shop_ar/domain_layer/usescases/collection.dart';
import 'package:ar_ecommerce/features/shop_ar/domain_layer/usescases/new_arrival.dart';
import 'package:ar_ecommerce/features/shop_ar/presentation_layer/utils/color_screen.dart';
import 'package:ar_ecommerce/features/shop_ar/presentation_layer/widgets/home_widgets/arrival_card.dart';
import 'package:ar_ecommerce/features/shop_ar/presentation_layer/widgets/home_widgets/home_collection_widget.dart';
import 'package:ar_ecommerce/features/shop_ar/presentation_layer/widgets/home_widgets/search_container_home.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
  // ? Simulated list of products and categories
  // List<Product> products = [
  //   Product(name: 'Pantalon', categories: [Category(name: 'Pantalons')]),
  //   Product(name: 'T-shirt 1', categories: [Category(name: 'T-shirts')]),
  //   Product(name: 'T-shirt 2', categories: [Category(name: 'T-shirts')]),
  // ];

// ? Liste Nouveau Produit
  final List<NewProduct> newProducts = [
    NewProduct(
      name: 'Polo T-Shirt 1',
      price: 3100,
      imageAsset: 'assets/images/arrivals/polo-1.jpg',
    ),
    NewProduct(
      name: 'PRAHO Polo Homme Manches Courtes - Bordeaux/Gris/Blanc',
      price: 3320,
      imageAsset: 'assets/images/arrivals/praho-polo.jpg',
    ),
    NewProduct(
      name: 'Polo Col Mao Pour Homme - Blanc',
      price: 3330,
      imageAsset: 'assets/images/arrivals/polo-col-mao.jpg',
    ),
    NewProduct(
      name: 'Chemise à Manches Courtes Pour Hommes',
      price: 2987,
      imageAsset: 'assets/images/arrivals/chemise-manche-court.jpg',
    ),

    NewProduct(
      name: 'Lunette class',
      price: 2987,
      imageAsset: 'assets/images/arrivals/arrivals1.png',
    ),
    // Add more products as needed
  ];

  // ? List Collection Produit
  final List<CollectionProduct> produitCollection = [
    CollectionProduct(
      name: 'Polo T-Shirt 1',
      imageAsset: 'assets/images/arrivals/polo-1.jpg',
    ),
    CollectionProduct(
      name: 'PRAHO Polo',
      imageAsset: 'assets/images/arrivals/praho-polo.jpg',
    ),
    CollectionProduct(
      name: 'Polo Col Mao Pour Homme - Blanc',
      imageAsset: 'assets/images/arrivals/polo-col-mao.jpg',
    ),
    CollectionProduct(
      name: 'Chemise',
      imageAsset: 'assets/images/arrivals/chemise-manche-court.jpg',
    ),

    CollectionProduct(
      name: 'Lunette de soleil',
      imageAsset: 'assets/images/arrivals/arrivals1.png',
    ),
    // Add more products as needed
  ];
  List<Category> categories = [
    Category(name: 'Tous'),
    Category(name: 'Pantalons'),
    Category(name: 'T-shirts'),
  ];

  // Selected default category
  // Category selectedCategory = Category(name: 'Tous');

  // Filtered products based on the selected category
  // List<Product> get filteredProducts {
  //   return products
  //       .where((product) =>
  //           selectedCategory.name == 'Tous' ||
  //           product.categories
  //               .any((category) => category.name == selectedCategory.name))
  //       .toList();
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   selectedCategory = categories.first; // Set the default category
  //   print(selectedCategory.name);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        iconTheme: const IconThemeData(color: whiteColor),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              size: 45,
            )),
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
          // IconButton(
          //   onPressed: () {},
          //   icon: Image.asset(
          //     "assets/images/icons/filter.png",
          //     color: Colors.white,
          //     width: 30,
          //   ),
          // ),
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
              // List of categories
              // Container(
              //   height: 50,
              //   margin: const EdgeInsets.symmetric(horizontal: 10),
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: categories.length,
              //     itemBuilder: (context, index) {
              //       return GestureDetector(
              //         onTap: () {
              //           // setState(() {
              //           //   selectedCategory = categories[index];
              //           //   print(selectedCategory.name);
              //           // });
              //         },
              //         child: Container(
              //           padding: EdgeInsets.all(10),
              //           margin: EdgeInsets.symmetric(horizontal: 8),
              //           decoration: BoxDecoration(
              //             // color: selectedCategory == categories[index]
              //             //     ? Colors.grey
              //             //     : Colors.transparent,
              //             color: Colors.grey,
              //             borderRadius: BorderRadius.circular(8),
              //           ),
              //           child: Center(
              //             child: Text(
              //               categories[index].name,
              //               style: TextStyle(
              //                   // color: selectedCategory == categories[index]
              //                   //     ? Colors.white
              //                   //     : Colors.black.withOpacity(0.8),
              //                   ),
              //             ),
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              const SizedBox(height: 10),
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
                      imageProduct: newProducts[index].imageAsset,
                      nameProduct: newProducts[index].name,
                      priceProduct: newProducts[index].price),
                ),
              ),
              const Gap(20),
              // ? Collection of products
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*  Stack(
                        children: [
                          // Heart Icon (Top Right)
                          Positioned(
                            top: 8,
                            right: 8,
                            child: IconButton(
                              onPressed: () {
                                // Handle favorite action
                              },
                              icon: Icon(
                                Icons.favorite_border,
                                color: Colors.red,
                                size: 24,
                              ),
                            ),
                          ),
                          // Bag Icon (Bottom Right)
                          Positioned(
                            bottom: 8,
                            right: 8,
                            child: IconButton(
                              onPressed: () {
                                // Handle bag action
                              },
                              icon: Icon(
                                Icons.shopping_bag,
                                color: Colors.red,
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      ),*/

/* const Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Price
                            Text(
                              '\$99.99', // Replace with your product price
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Product Name
                            Text(
                              'Product Name', // Replace with your product name
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ), */

/* Expanded(
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    filteredProducts[index].name,
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              },
            ),
          ),*/
