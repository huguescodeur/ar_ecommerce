import 'package:ar_ecommerce/features/shop_ar/domain_layer/usescases/categrorie_produit.dart';
import 'package:ar_ecommerce/features/shop_ar/presentation_layer/utils/color_screen.dart';
import 'package:flutter/material.dart';

class ListCollection extends StatefulWidget {
  const ListCollection({super.key});

  @override
  State<ListCollection> createState() => _ListCollectionState();
}

class _ListCollectionState extends State<ListCollection> {
  List<Category> categories = [
    // Category(name: 'Tous'),
    Category(name: 'Pantalons'),
    Category(name: 'T-shirts'),
    Category(name: 'Chaussures'),
    Category(name: 'Lunettes'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        // color: Colors.amber,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10),
          scrollDirection: Axis.vertical, // Faites défiler horizontalement
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Réagir au clic sur une catégorie
                // Vous pouvez implémenter la logique pour afficher les produits de cette catégorie ici
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  categories[index].name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
