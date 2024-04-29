import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaurrant.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatelessWidget {
  MyCurrentLocation({super.key});

  final textController = TextEditingController();

  void openLocationSearchBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Your location"),
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(hintText: "Enter Your address.."),
        ),
        actions: [
          //cancel buttton
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              textController.clear();
            },
            child: const Text("Cancel"),
          ),

          //save button
          MaterialButton(
            onPressed: () {
              // update delivery address
              String newAddress = textController.text;
              context.read<Restaurants>().updateDeliveryAddress(newAddress);
              Navigator.pop(context);
              textController.clear();
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Deliver now",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                //address
                Consumer<Restaurants>(
                  builder: (context, restaurant, child) => Text(
                    restaurant.deliveryAddress,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                //drop down menu
                const Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
