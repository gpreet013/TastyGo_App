import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTab;

  const FoodTile({
    super.key,
    required this.food,
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTab,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                //text food details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food.name),
                      Text(
                        food.price.toString(),
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        food.description,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                //food image

                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    food.imagePath,
                    height: 120,
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: Theme.of(context).colorScheme.primary,
          endIndent: 25,
          indent: 25,
        ),
      ],
    );
  }
}
