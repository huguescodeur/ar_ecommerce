// import 'package:ar_ecommerce/features/shop_ar/data_layer/data_product.dart';
// import 'package:ar_ecommerce/features/shop_ar/domain_layer/usescases/new_arrival.dart';
// import 'package:flutter/material.dart';

// class AffichageProductCollection extends StatefulWidget {
//   const AffichageProductCollection({super.key});

//   @override
//   State<AffichageProductCollection> createState() => _AffichageProductCollectionState();
// }

// class _AffichageProductCollectionState extends State<AffichageProductCollection> {
//   List<NewProduct> productsInCollection = allProducts
//       .where((allProducts) => allProducts.categories == collectionName)
//       .toList();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Produits de $collectionName'),
//       ),
//       body: ListView.builder(
//         itemCount: productsInCollection.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(productsInCollection[index].name),
//             // Ajoutez ici d'autres détails du produit
//           );
//         },
//       ),
//     );
    
//   }
// }

