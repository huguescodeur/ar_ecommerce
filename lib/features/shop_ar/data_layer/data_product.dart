import 'package:ar_ecommerce/features/shop_ar/domain_layer/usescases/categrorie_produit.dart';
import 'package:ar_ecommerce/features/shop_ar/domain_layer/usescases/collection.dart';
import 'package:ar_ecommerce/features/shop_ar/domain_layer/usescases/new_arrival.dart';
import 'package:ar_ecommerce/features/shop_ar/presentation_layer/utils/constants/colors.dart';
import 'package:ar_ecommerce/features/shop_ar/presentation_layer/widgets/home_widgets/banner_widget.dart';
import 'package:flutter/material.dart';

// ? List Tous Les Produit
final List<NewProduct> allProducts = [
  NewProduct(
      id: 1,
      name: 'Gamma shoes with beta brand.',
      price: 4987,
      imageAsset: 'assets/images/shoe3_splash.png',
      categories: [Category(name: 'Chaussures')]),

  NewProduct(
      id: 2,
      name:
          'PRAHO Polo Homme Manches Courtes - Bordeaux/Gris/Blanc Homme - Blanc',
      price: 3320,
      imageAsset: 'assets/images/arrivals/praho-polo.jpg',
      categories: [Category(name: 'T-shirts')]),
  NewProduct(
      id: 3,
      name: 'Polo Col Mao Pour Homme - Blanc',
      price: 3330,
      imageAsset: 'assets/images/arrivals/polo-col-mao.jpg',
      categories: [Category(name: 'T-shirts')]),
  NewProduct(
      id: 4,
      name: 'Polo T-Shirt 1 Homme - Blanc',
      price: 3100,
      imageAsset: 'assets/images/arrivals/polo-1.jpg',
      categories: [Category(name: 'T-shirts')]),

  NewProduct(
      id: 5,
      name: 'Lunette class',
      price: 2987,
      imageAsset: 'assets/images/arrivals/arrivals1.png',
      categories: [Category(name: 'Lunettes')]),
  NewProduct(
      id: 6,
      name: 'white sneaker with adidas logo',
      price: 5987,
      imageAsset: 'assets/images/shoe1_splash.png',
      categories: [Category(name: 'Chaussures')]),
  NewProduct(
      id: 7,
      name: 'Black Jeans with blue stripes',
      price: 1987,
      imageAsset: 'assets/images/pantalon1_splash.png',
      categories: [Category(name: 'Pantalons')]),
  NewProduct(
      id: 8,
      name: 'Red shoes with black stripes',
      price: 2987,
      imageAsset: 'assets/images/shoe2_splash.png',
      categories: [Category(name: 'Chaussures')]),

  NewProduct(
      id: 9,
      name: 'Chemise à Manches Courtes Pour Hommes',
      price: 2987,
      imageAsset: 'assets/images/arrivals/chemise-manche-court.jpg',
      categories: [Category(name: 'T-shirts')]),

  NewProduct(
      id: 10,
      name: 'Alpha t-shirt for alpha testers.',
      price: 1187,
      imageAsset: 'assets/images/tshirt1_splash.png',
      categories: [Category(name: 'T-shirts')]),
  NewProduct(
      id: 11,
      name: 'Beta jeans for beta testers',
      price: 1127,
      imageAsset: 'assets/images/pantalon2_splash.png',
      categories: [Category(name: 'Pantalons')]),
  NewProduct(
      id: 12,
      name: 'V&V  model white t shirts.',
      price: 1127,
      imageAsset: 'assets/images/tshirt2_splash.png',
      categories: [Category(name: 'T-shirts')]),

  // Add more products as needed
];

// ? Liste Nouveau Produit
final List<NewProduct> newProducts = [
  NewProduct(
    id: 1,
    name: 'Polo T-Shirt 1 Homme - Blanc',
    price: 3100,
    imageAsset: 'assets/images/arrivals/polo-1.jpg',
  ),
  NewProduct(
    id: 2,
    name:
        'PRAHO Polo Homme Manches Courtes - Bordeaux/Gris/Blanc Homme - Blanc',
    price: 3320,
    imageAsset: 'assets/images/arrivals/praho-polo.jpg',
  ),
  NewProduct(
    id: 3,
    name: 'Polo Col Mao Pour Homme - Blanc',
    price: 3330,
    imageAsset: 'assets/images/arrivals/polo-col-mao.jpg',
  ),
  NewProduct(
    id: 4,
    name: 'Chemise à Manches Courtes Pour Hommes',
    price: 2987,
    imageAsset: 'assets/images/arrivals/chemise-manche-court.jpg',
  ),

  NewProduct(
    id: 5,
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
    name: 'Polo Col Mao Pour Homme - Blanc ',
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

// ? Liste Catégorie Produit
List<Category> categories = [
  Category(name: 'Tous'),
  Category(name: 'Pantalons'),
  Category(name: 'T-shirts'),
  Category(name: 'Chaussures'),
  Category(name: 'Lunettes'),
];

// ? Liste Banner Produit
final List<BannerWidget> banners = [
  const BannerWidget(
    text: "Up To 50% Off",
    btnText: "Buy Now",
    backgroundColor: kBlackColor,
    btnBgColor: kPrimaryColor,
    textDirection: TextDirection.ltr,
    imgWidth: 130,
    titleColor: Colors.white,
    buttonColor: Colors.white,
    image: "assets/images/shoe1.png",
  ),
  const BannerWidget(
    text: "T-Shirt for Sale",
    btnText: "Grab Now",
    backgroundColor: Colors.teal,
    btnBgColor: Colors.white,
    textDirection: TextDirection.ltr,
    imgWidth: 130,
    titleColor: Colors.white,
    buttonColor: kPrimaryColor,
    image: "assets/images/slide-3.png",
  ),
  const BannerWidget(
    text: "Cheap Prices",
    btnText: "Buy Now",
    backgroundColor: Colors.purpleAccent,
    btnBgColor: Colors.white,
    textDirection: TextDirection.ltr,
    imgWidth: 130,
    titleColor: Colors.white,
    buttonColor: Colors.black,
    image: "assets/images/dress.png",
  ),
  const BannerWidget(
    text: "Body Fit Shirt",
    btnText: "Buy Now",
    backgroundColor: Colors.brown,
    btnBgColor: kPrimaryColor,
    textDirection: TextDirection.ltr,
    imgWidth: 130,
    titleColor: Colors.white,
    buttonColor: Colors.white,
    image: "assets/images/shirt.png",
  ),
];
