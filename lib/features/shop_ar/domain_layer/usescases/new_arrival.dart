import 'package:ar_ecommerce/features/shop_ar/domain_layer/usescases/categrorie_produit.dart';

class NewProduct {
  final int ? id;
  final String name;
  final double price;
  final String imageAsset;
  final List<Category>? categories;

  NewProduct({
    required this.id,
    required this.name,
    required this.price,
    required this.imageAsset,
    this.categories
  });
}
