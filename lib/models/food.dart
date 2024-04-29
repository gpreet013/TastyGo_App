class Food {
  final String name; //cheese Burger
  final String description; // a burger full of cheese
  final String imagePath;
  final double price;
  final FoodCategory category; //buger
  List<Addon> availableAddons; //[extra cheese]

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons,
  });
}

// food categories
enum FoodCategory {
  Burgers,
  Salads,
  Pizza,
  Desserts,
  Drinks,
}

//food addons

class Addon {
  String name;
  double price;

  Addon({
    required this.name,
    required this.price,
  });
}
