import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/models/cart_item.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Restaurants extends ChangeNotifier {
  // List of food menu
  final List<Food> _menu = [
    // burgers
    Food(
      name: "Cheese burger",
      description:
          "CHESSY AND JUICY BURGER with letuce .tomato and hint of onion and pickle",
      imagePath: "lib/images/burger/Designer.png",
      price: 60,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: "Extra Chesse ", price: 20),
        Addon(name: "Double patty", price: 30),
      ],
    ),
    Food(
      name: "Veggie burger",
      description:
          "A hearty vegetarian delight with a flavorful vegetable pattye",
      imagePath: "lib/images/burger/burger cheese.png",
      price: 60,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: "Cheese ", price: 20),
        Addon(name: "Grilled Mushrooms", price: 30),
        Addon(name: "Avocado", price: 30)
      ],
    ),
    Food(
      name: "Tandori burger",
      description:
          "A fiery fusion of tandoori-spiced patty with zesty toppings.",
      imagePath: "lib/images/burger/Designer.png",
      price: 60,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: "Mint Yogurt Sauce", price: 20),
        Addon(name: "Pickled Onions", price: 30),
        Addon(name: "Lettuce and Tomato:", price: 30)
      ],
    ),
    Food(
      name: " Desi Aloo Tikki Burger",
      description:
          "Spicy potato patty topped with tangy chutneys and crunchy sev. A flavorful delight!",
      imagePath: "lib/images/burger/double patty.png",
      price: 60,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: "Tamarind Sauce", price: 20),
        Addon(name: "Chaat Masala", price: 30),
        Addon(name: "Crunchy Sev:", price: 30)
      ],
    ),

    // drinks
    Food(
      name: "Pepsi",
      description:
          "Cool and fizzy, Pepsi quenches your thirst with a burst of flavor.",
      imagePath: "lib/images/drinks/pepsi.png",
      price: 60,
      category: FoodCategory.Drinks,
      availableAddons: [
        Addon(name: "Lemon Wedge ", price: 10),
        Addon(name: "Mint Leaves", price: 10)
      ],
    ),
    Food(
      name: "Coke",
      description:
          " Classic Coca-Cola with a zesty lemon twist, garnished with mint. Refreshing!",
      imagePath: "lib/images/drinks/coke.png",
      price: 60,
      category: FoodCategory.Drinks,
      availableAddons: [
        Addon(name: "Lemon Wedge ", price: 10),
        Addon(name: "Mint Leaves", price: 10)
      ],
    ),
    Food(
      name: "Sprite",
      description:
          "Sparkling lemon-lime soda with a zesty kick and thirst-quenching bubbles. Refreshing and invigorating!",
      imagePath: "lib/images/drinks/sprite.png",
      price: 60,
      category: FoodCategory.Drinks,
      availableAddons: [
        Addon(name: "Lemon Slice ", price: 10),
        Addon(name: "Mint Leaves", price: 10)
      ],
    ),
    Food(
      name: "Mountain dew",
      description:
          "A bubbly citrus soda with a zesty kick, perfect for refreshing moments",
      imagePath: "lib/images/drinks/dew.png",
      price: 60,
      category: FoodCategory.Drinks,
      availableAddons: [
        Addon(name: "Lemon Slice ", price: 10),
        Addon(name: "Mint Leaves", price: 10)
      ],
    ),

    // desserts
    Food(
      name: "Cheese cake",
      description:
          "Creamy, velvety cheesecake topped with luscious berries and decadent caramel sauce.",
      imagePath: "lib/images/desserts/cheese cake.png",
      price: 60,
      category: FoodCategory.Desserts,
      availableAddons: [
        Addon(name: "Fresh Berries ", price: 20),
        Addon(name: "Whipped Cream", price: 30),
        Addon(name: "Caramel Sauce", price: 30)
      ],
    ),
    Food(
      name: "Tiramisu",
      description:
          "ecadent Italian dessert with layers of coffee-soaked biscuits and creamy mouth watering  filling.",
      imagePath: "lib/images/desserts/tiramisu.png",
      price: 60,
      category: FoodCategory.Desserts,
      availableAddons: [
        Addon(name: "Coffee Liqueur", price: 20),
        Addon(name: "Whipped Cream", price: 30)
      ],
    ),

    Food(
      name: "Apple pie",
      description:
          "Warm, comforting dessert with a flaky crust and sweet apple filling.",
      imagePath: "lib/images/desserts/applepie.png",
      price: 60,
      category: FoodCategory.Desserts,
      availableAddons: [
        Addon(name: "Vanilla Ice Cream ", price: 20),
        Addon(name: "Cinnamon Sugar", price: 30)
      ],
    ),

    Food(
      name: "Ice Creams",
      description:
          "Creamy, cold treats topped with delightful chocolate sauce, sprinkles, and fresh fruit. Deliciously satisfying!",
      imagePath: "lib/images/desserts/ice cream.png",
      price: 60,
      category: FoodCategory.Desserts,
      availableAddons: [
        Addon(name: "Chocolate Sauce", price: 20),
        Addon(name: "Rainbow Sprinkles", price: 30),
        Addon(name: "Fresh Fruit", price: 30),
      ],
    ),

    // pizzas
    Food(
      name: "Paneer Makhani Pizza",
      description:
          "A savory pizza with creamy paneer, vibrant peppers, and fragrant garlic butter drizzle",
      imagePath: "lib/images/pizzas/makhni.png",
      price: 60,
      category: FoodCategory.Pizza,
      availableAddons: [
        Addon(name: "Bell Peppers:", price: 20),
        Addon(name: "Red Onions", price: 30),
        Addon(name: "Rosted Paneer", price: 30),
      ],
    ),
    Food(
      name: "Farmhouse pizza",
      description:
          "A rustic pizza with paneer, bell peppers, and sweet corn toppings. Bursting with flavors!",
      imagePath: "lib/images/pizzas/farmhouse pizaa.png",
      price: 60,
      category: FoodCategory.Pizza,
      availableAddons: [
        Addon(name: "Extra Chesse ", price: 20),
        Addon(name: "Baby corns", price: 30),
      ],
    ),

    Food(
      name: "Tandoori Paneer Pizza.",
      description:
          "Spicy tandoori paneer pizza topped with bell peppers, red onions, and fresh coriander. Deliciously aromatic!",
      imagePath: "lib/images/pizzas/tandorri.png",
      price: 60,
      category: FoodCategory.Pizza,
      availableAddons: [
        Addon(name: "Extra Chesse ", price: 20),
        Addon(name: "Thin Crust", price: 30),
      ],
    ),

    Food(
      name: "Margherita Pizza",
      description:
          " Classic pizza topped with tangy tomato sauce, creamy mozzarella, and fragrant basil leaves.",
      imagePath: "lib/images/pizzas/margirta.png",
      price: 60,
      category: FoodCategory.Pizza,
      availableAddons: [
        Addon(name: "Fresh Basil Leaves", price: 20),
        Addon(name: "Garlic Infused Olive Oil", price: 30),
        Addon(name: "Cherry Tomatoes", price: 30),
      ],
    ),
    Food(
      name: "Cheese and Corn Pizza",
      description:
          " Savory pizza loaded with gooey cheese, sweet corn, and flavorful toppings. Truly satisfying!",
      imagePath: "lib/images/pizzas/cheese corn.png",
      price: 60,
      category: FoodCategory.Pizza,
      availableAddons: [
        Addon(name: "Extra Chesse ", price: 20),
        Addon(name: "Thin Crust", price: 30),
      ],
    ),

    // salads
    Food(
      name: "green veggi salad",
      description:
          "Crisp greens with vibrant veggies, topped with toasted nuts. Refreshingly delicious!",
      imagePath: "lib/images/salads/green veggi salad.png",
      price: 60,
      category: FoodCategory.Salads,
      availableAddons: [
        Addon(name: "Dried Cranberries ", price: 20),
        Addon(name: "Feta Cheese Crumbles", price: 30),
      ],
    ),
    Food(
      name: "Crunchy Chickpea Quinoa Salad ",
      description:
          " Packed with roasted chickpeas for added texture and protein. Deliciously wholesome!",
      imagePath: "lib/images/salads/quinoa salad.png",
      price: 60,
      category: FoodCategory.Salads,
      availableAddons: [
        Addon(name: "Extra Chesse ", price: 20),
        Addon(name: "Extra Crunchy Chickpea ", price: 30),
      ],
    ),

    Food(
      name: "Chickpea salad",
      description:
          "Refreshing chickpea salad with bell peppers, feta cheese, and toasted almonds. Perfectly balanced and nutritious!",
      imagePath: "lib/images/salads/chickpea salad.png",
      price: 60,
      category: FoodCategory.Salads,
      availableAddons: [
        Addon(name: "Diced Bell Peppers ", price: 20),
        Addon(name: "Roasted Nuts", price: 30),
      ],
    ),
    Food(
      name: "Full green veggi salad",
      description:
          "A refreshing mix of crisp greens, with crunchy almonds, tangy cranberries, and creamy feta. Deliciously wholesome!",
      imagePath: "lib/images/salads/full green veggi bowl.png",
      price: 60,
      category: FoodCategory.Salads,
      availableAddons: [
        Addon(name: "Dried Cranberries", price: 20),
        Addon(name: "Feta Cheese Crumbles", price: 30),
      ],
    ),
  ];

  // user cart

  //delivery address which user can  change and update
  String _deliveryAddress = '161-Grewalz';

/*

G E T T E R
 

*/

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

/*
O P E R A T I O N S
*/

//user cart
  final List<CartItem> _cart = [];

// ADD TO THE CART
  void addToCart(Food food, List<Addon> selectedAddons) {
    // seee if there is a cart item already with the sME Food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food items are same

      bool isSameFood = item.food == food;

      // check if the list of selected addons are the same
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });
    //  if item i already pressent in cart

    if (cartItem != null) {
      cartItem.quantity++;
    }
    //otherwise add item in cart
    else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
    //to update the ui
    notifyListeners();
  }

// REMOVE FROM THE CART

  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }

    notifyListeners();
  }

// GET TOTAL PRICE OF THE CART
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

// GET TOTAL NUMBER OF ITEMS IN CART
  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

//CLEAR THE CART
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

//update delivery address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }
// H E L P E R S

//genrate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here your receipt.");
    receipt.writeln();

    //format the date to include up to seconds only
    String formattedDate =
        DateFormat('dd-MM-yyyy HH:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("-------------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity}  x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("Add-ons : ${_formatAddon(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln("--------------");
    receipt.writeln();
    receipt.writeln('Total Item : ${getTotalItemCount()}');
    receipt.writeln('Total Price : ${_formatPrice(getTotalPrice())}');
    receipt.writeln();
    receipt.writeln("Delivery to : $deliveryAddress");

    return receipt.toString();
  }

//format dounble value into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }
  //format list of addons into a sting summary

  String _formatAddon(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name}(${_formatPrice(addon.price)})")
        .join(",");
  }
}
