import 'package:flutter/material.dart';

class Product {
  final String name;
  final List<Category> categories;

  Product({required this.name, required this.categories});
}

class Category {
  final String name;

  Category({required this.name});
}

class HomeScreens extends StatefulWidget {
  const HomeScreens({Key? key}) : super(key: key);

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  // Simulated list of products and categories
  List<Product> products = [
    Product(name: 'Pantalon', categories: [Category(name: 'Pantalons')]),
    Product(name: 'T-shirt 1', categories: [Category(name: 'T-shirts')]),
    Product(name: 'T-shirt 2', categories: [Category(name: 'T-shirts')]),
  ];

  List<Category> categories = [
    Category(name: 'Tous'),
    Category(name: 'Pantalons'),
    Category(name: 'T-shirts'),
  ];

  // Selected default category
  Category selectedCategory = Category(name: 'Tous');

  // Filtered products based on the selected category
  List<Product> get filteredProducts {
    return products
        .where((product) =>
            selectedCategory.name == 'Tous' ||
            product.categories
                .any((category) => category.name == selectedCategory.name))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('E-commerce App'),
      ),
      body: Column(
        children: <Widget>[
          // Your existing code for the search bar
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(Icons.search),
                const SizedBox(width: 10),
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
          // List of categories
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
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: selectedCategory == categories[index]
                          ? Colors.grey
                          : Colors.transparent,
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
          // List of products
          Expanded(
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredProducts[index].name),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
