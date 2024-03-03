// ignore_for_file: sized_box_for_whitespace, depend_on_referenced_packages

import 'package:ar_ecommerce/features/shop_ar/domain_layer/usescases/categrorie_produit.dart';
import 'package:ar_ecommerce/features/shop_ar/domain_layer/usescases/new_arrival.dart';
import 'package:ar_ecommerce/features/shop_ar/presentation_layer/utils/color_screen.dart';
import 'package:ar_ecommerce/features/shop_ar/presentation_layer/widgets/home_widgets/arrival_card.dart';
import 'package:ar_ecommerce/features/shop_ar/data_layer/data_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

// import 'package:another_carousel_pro/another_carousel_pro.dart';

final List<String> imgList = [
  'assets/images/banners/banner-1.png',
  'assets/images/banners/banner-2.png',
];

// final themeMode = ValueNotifier(2);

class BagScreen extends StatefulWidget {
  const BagScreen({Key? key}) : super(key: key);

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  // Selected default category
  Category selectedCategory = Category(name: 'Tous');

  // Filtered products based on the selected category
  List<NewProduct> get filteredProducts {
    return allProducts
        .where((allProduct) =>
            selectedCategory.name == 'Tous' ||
            allProduct.categories!
                .any((category) => category.name == selectedCategory.name))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondaryColor,
        appBar: AppBar(
          backgroundColor: secondaryColor,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Recherche...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = categories[index];
                          print(selectedCategory.name);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: selectedCategory == categories[index]
                              ? Colors.red
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            categories[index].name,
                            style: TextStyle(
                              color: selectedCategory == categories[index]
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: filteredProducts.length,
              //     itemBuilder: (context, index) {
              //       return ListTile(
              //         title: Text(filteredProducts[index].name),
              //       );
              //     },
              //   ),
              // ),
              const SizedBox(height: 10),
              GridView.builder(
                padding: const EdgeInsets.only(bottom: 15),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  // crossAxisSpacing: 8.0,
                  // mainAxisSpacing: 10.0,
                  mainAxisExtent: 410,
                ),
                // itemCount: allProducts.length,
                itemCount: filteredProducts.length,
                itemBuilder: (_, index) {
                  // String price = gridMap[index]["price"];
                  return
                      // ListTile(
                      //         title: Text(
                      //   filteredProducts[index].name,
                      //   style: TextStyle(color: Colors.red),
                      // ))
                      arrivalCard(
                          product: NewProduct(
                              id: filteredProducts[index].id,
                              name: filteredProducts[index].name,
                              price: filteredProducts[index].price,
                              imageAsset: filteredProducts[index].imageAsset),
                          context: context)
                      // arrivalCard(
                      //     product: NewProduct(
                      //         id: allProducts[index].id,
                      //         name: allProducts[index].name,
                      //         price: allProducts[index].price,
                      //         imageAsset: allProducts[index].imageAsset),
                      //     context: context)
                      ;
                },
              ),
            ],
          ),
        )));
  }
}

/*Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              16.0,
            ),
            color: Colors.amberAccent.shade100,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                child: Image.network(
                  "${gridMap.elementAt(index)['images']}",
                  height: 170,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${gridMap.elementAt(index)['title']}",
                      style: Theme.of(context).textTheme.subtitle1!.merge(
                            const TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "${gridMap.elementAt(index)['price']}",
                      style: Theme.of(context).textTheme.subtitle2!.merge(
                            TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.grey.shade500,
                            ),
                          ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            CupertinoIcons.heart,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            CupertinoIcons.cart,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );*/

/*Stack(
                  children: [
                    Container(
                      // height: 300,

                      width: double.infinity,
                      color: Colors.yellow,
                      child: CarouselSlider.builder(
                        itemCount: imgList.length,
                        options: CarouselOptions(
                            viewportFraction: 1.0, height: 400, autoPlay: true),
                        itemBuilder: (context, index, realIndex) {
                          final urlImage = imgList[index];
                          return buildImage(urlImage, index);
                        },
                      ),
                    ),
                    const Positioned(
                      left: 20,
                      bottom: 30,
                      child: Text(
                        "Street clothes",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )*/

/* Widget buildImage(String urlImage, int index) => Container(
        // color: Colors.red,
        width: double.infinity,
        child: Image.asset(
          urlImage,
          fit: BoxFit.cover,
        ),
      );*/
