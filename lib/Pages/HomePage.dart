import 'package:flutter/material.dart';
import 'package:food_delivery_app/Components/my_current_location.dart';
import 'package:food_delivery_app/Components/my_description_box.dart';
import 'package:food_delivery_app/Components/my_drawer.dart';
import 'package:food_delivery_app/Components/my_food_tile.dart';
import 'package:food_delivery_app/Components/my_sliver_app_bar.dart';
import 'package:food_delivery_app/Components/my_tab_bar.dart';
import 'package:food_delivery_app/Pages/food_page.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:food_delivery_app/models/restaurrant.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  //tab controller
  late TabController _tabController;

  @override
  // tab names show on top burger drink etc
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

// sort out and return a list of food items that belong to specific category
  List<Food> _filterMenuCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  //return list of foods in given category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuCategory(category, fullMenu);
      return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: categoryMenu.length,
        itemBuilder: (context, index) {
          //get individual food
          final food = categoryMenu[index];

          // return food tile ui
          return FoodTile(
            food: food,
            onTab: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => FoodPage(food: food))),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MyDrawer(), //burger widget
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            MySliverAppBar(
                title: MyTabBar(
                  tabController: _tabController,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Divider(
                      indent: 25,
                      endIndent: 25,
                      color: Theme.of(context).colorScheme.secondary,
                    ),

                    //my location
                    MyCurrentLocation(),

                    //description box
                    const MyDescriptionBox(),
                  ],
                )),
          ],
          body: Consumer<Restaurants>(
            builder: (context, restaurrent, child) => TabBarView(
              controller: _tabController,
              children: getFoodInThisCategory(restaurrent.menu),
            ),
          ),
        ));
  }
}
