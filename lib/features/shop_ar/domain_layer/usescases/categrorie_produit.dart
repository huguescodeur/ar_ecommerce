class Product {
  final String name;
  final List<Category>? categories;

  Product({required this.name, this.categories});
}

class Category {
  final String name;

  Category({required this.name});
}
