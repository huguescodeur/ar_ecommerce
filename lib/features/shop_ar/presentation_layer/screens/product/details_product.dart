// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:readmore/readmore.dart';

import '../../../domain_layer/usescases/new_arrival.dart';
import '../../utils/color_screen.dart';

class ProductDetailsPage extends StatelessWidget {
  final NewProduct product;

  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Hero(
          tag: 'product_${product.id}',
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2.3,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.blue[100],
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(product.imageAsset))),
                    ),
                    Container(
                      height: 100,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      // color: Colors.amber,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.red.shade400,
                                shape: BoxShape.circle),
                            child: IconButton(
                                onPressed: () => Navigator.of(context).pop(),
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 30,
                                )),
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.red.shade400,
                                shape: BoxShape.circle),
                            child: IconButton(
                                onPressed: () => Navigator.of(context).pop(),
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                  size: 30,
                                )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Gap(30),
                Container(
                  height: MediaQuery.of(context).size.height / 1.9,
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: double.infinity,
                          // color: Colors.blue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.6,
                                  // color: Colors.red,
                                  margin: const EdgeInsets.only(right: 70),
                                  child: Text(
                                    product.name,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    // textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      height: 0,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 45,
                                width: 120,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                        onPressed: () => print("moins"),
                                        icon: Icon(Icons.remove)),
                                    Text(
                                      "2",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                        onPressed: () => print("moins"),
                                        icon: Icon(Icons.add)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          // height: 90,
                          width: double.infinity,
                          // color: Colors.blue,
                          // padding: const EdgeInsets.only(top: 8),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.6,
                                  // color: Colors.red,
                                  margin: const EdgeInsets.only(right: 70),
                                  child: Text(
                                    product.name,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    // textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      // color: Colors.grey,
                                      fontSize: 16,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      height: 0,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 18.0),
                                child: Text(
                                  "Disponible \n en stock",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none),
                                ),
                              )
                            ],
                          ),
                        ),
                        const Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text(
                              "(230 Avis)",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  decoration: TextDecoration.none),
                            )
                          ],
                        ),
                        const Gap(18),
                        Container(
                          width: double.infinity,
                          // padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Taille",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    decoration: TextDecoration.none),
                              ),
                              const Gap(10),
                              Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        // color: Colors.amber,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.grey, width: 2)),
                                    child: const Center(
                                        child: Text(
                                      "S",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )),
                                  ),
                                  const Gap(10),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        // color: Colors.amber,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.grey, width: 2)),
                                    child: const Center(
                                        child: Text(
                                      "M",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )),
                                  ),
                                  const Gap(10),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        // color: Colors.amber,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.grey, width: 2)),
                                    child: const Center(
                                        child: Text(
                                      "L",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )),
                                  ),
                                  const Gap(10),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.grey, width: 2)),
                                    child: const Center(
                                        child: Text(
                                      "XL",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )),
                                  ),
                                  const Gap(10),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        // color: Colors.amber,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.grey, width: 2)),
                                    child: Center(
                                        child: Text(
                                      "XXL",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )),
                                  ),
                                ],
                              ),
                              const Gap(15),
                              const Text(
                                "Description",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    decoration: TextDecoration.none),
                              ),
                            ],
                          ),
                        ),
                        const Gap(10),
                        Container(
                          width: double.infinity,
                          // color: Colors.amber,
                          child: const ReadMoreText(
                            'Discover all the intensity, precision and comfort of the Xbox One Wireless Controller. Pulse triggers let you experience vibration feedback so you hear every shot and jolt in high definition',
                            trimLines: 2,
                            style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.none),
                            colorClickableText: secondaryColor,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Voir plus',
                            trimExpandedText: ' reduire',
                            moreStyle: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                            lessStyle: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Gap(20),
                        Container(
                          height: 70,
                          width: double.infinity,
                          // margin: const EdgeInsets.only(bottom: 20),
                          padding: const EdgeInsets.only(
                              left: 18, right: 8, top: 6, bottom: 6),
                          decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Row(
                            children: [
                              Expanded(
                                child: OverflowBox(
                                  maxHeight: double.infinity,
                                  child: Container(
                                    // height: 50,
                                    width: 50,
                                    // color: Colors.green,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Text("data"),
                                        const Text(
                                          "Prix total",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              decoration: TextDecoration.none),
                                        ),
                                        Text(
                                          "${product.price} FCFA",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              // fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              decoration: TextDecoration.none),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 200,
                                child: ElevatedButton(
                                    style: const ButtonStyle(
                                        // tapTargetSize:
                                        //     MaterialTapTargetSize.shrinkWrap,
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.red)),
                                    onPressed: () {},
                                    child: const ListTile(
                                      leading: Icon(
                                        Icons.shopping_bag,
                                        color: Colors.white,
                                      ),
                                      title: Text(
                                        "Ajouter",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            decoration: TextDecoration.none),
                                      ),
                                    )),
                              ),
                              // Container(
                              //   height: 60,
                              //   width: MediaQuery.sizeOf(context).width / 2,
                              //   color: Colors.red,
                              //   child: Column(
                              //     children: [
                              //       Text(
                              //         "Prix total",
                              //         style: TextStyle(color: Colors.grey),
                              //       ),
                              //       Text(
                              //         "${product.price} FCFA",
                              //         style: const TextStyle(
                              //             color: Colors.white,
                              //             // fontSize: 25,
                              //             fontWeight: FontWeight.bold,
                              //             decoration: TextDecoration.none),
                              //       ),
                              //     ],
                              //   ),
                              // )
                            ],
                          ),
                        ),
                        const Gap(70)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
