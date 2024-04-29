import 'package:flutter/material.dart';
import 'package:food_delivery_app/Components/my_button.dart';
import 'package:food_delivery_app/Components/my_cart_tile.dart';
import 'package:food_delivery_app/Pages/payment_page.dart';
import 'package:food_delivery_app/models/restaurrant.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurants>(builder: (context, restaurant, child) {
      //cart
      final userCart = restaurant.cart;

      //sacffold ui
      return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          centerTitle: true,
          actions: [
            //clear cart button
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title:
                        const Text("are you sure you want to clear the cart"),
                    actions: [
                      //cancelbutton
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("cancel"),
                      ),
                      //yes button
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          restaurant.clearCart();
                        },
                        child: const Text("yes"),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.delete),
            )
          ],
        ),
        body: Column(
          children: [
            //list of cart
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty
                      ? const Expanded(
                          child: Center(
                            child: Text("cart is empty"),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
                                //get individual cart item
                                final cartItem = userCart[index];

                                //return cart tile ui
                                return MyCartTile(cartItem: cartItem);
                              }),
                        ),
                ],
              ),
            ),

            //button to pay
            MyButton(
              text: "Go to check out",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PaymentPage(),
                ),
              ),
            ),

            const SizedBox(
              height: 25,
            )
          ],
        ),
      );
    });
  }
}
