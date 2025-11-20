import 'package:flutter/material.dart';
import 'package:pizza_app/components/drink_tile.dart';
import 'package:pizza_app/components/food_tile.dart';
import 'package:pizza_app/models/food.dart';
import 'package:pizza_app/models/drink.dart';
import 'package:pizza_app/pages/food_details_page.dart';
import 'package:pizza_app/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pizza_app/models/shop.dart';
import 'package:pizza_app/components/button.dart';
import 'package:pizza_app/pages/cart_page.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  //navigation to food details page
  void _navigateToFoodDetails(int index) {

  // get the shop and its food menu
  final shop = context.read<Shop>();
  final foodMenu = shop.foodMenu;

    Navigator.push(
      context, MaterialPageRoute(
      builder: (context) => FoodDetailsPage(
      food:foodMenu[index],
    ),
    ),
    );
  }
    

  //drink menu
  List drinkMenu = [
    Drink(
        name: "Coca Cola",
        price: 2.99,
        imagePath: "assets/images/cola.png",
        rating: "4.8"),
    Drink(
        name: "Orange Juice",
        price: 3.49,
        imagePath: "assets/images/juice_orange.png",
        rating: "4.7"),
    Drink(
        name: "Lemon Tea",
        price: 2.99,
        imagePath: "assets/images/lemontea.png",
        rating: "4.6"),
    Drink(
        name: "Lemon Squash",
        price: 3.99,
        imagePath: "assets/images/lemon_squash.png",
        rating: "4.8"),
  ];

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
     // get the shop and its food menu
  final shop = context.read<Shop>();
   final foodMenu = shop.foodMenu;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: primarycolor,
        leading: const Icon(
          Icons.menu,
        ),
        title: Text(
          'MENU',
          style: GoogleFonts.poppins(),
        ),
        actions: [

          // cart icon button
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cartpage');
            },
            icon: const Icon(Icons.shopping_cart_rounded,
            ),
            ),
          
        ],
      ),

      // Scroll seluruh halaman
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // promo pizza
            Container(
              decoration: BoxDecoration(
                color: primarycolor,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding:
                  const EdgeInsets.symmetric(vertical: 25, horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'All Pizza Promo in this week!',
                        style: GoogleFonts.caveatBrush(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 30),
                        child: Text(
                          'Up to 50% Off',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: primarycolor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/promo.png',
                    width: 130,
                    height: 130,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Pizza...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 25),

            // Pizza Menu Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Pizza Menu",
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),

            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodMenu.length,
                itemBuilder: (context, index) => FoodTile(
                  food: foodMenu[index], 
                  onTap: () => _navigateToFoodDetails(index),
                  ),
              ),
            ),
            const SizedBox(height: 25),

            // Drink Menu Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Drink Menu",
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),

            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: drinkMenu.length,
                itemBuilder: (context, index) =>
                    DrinkTile(drink: drinkMenu[index]),
              ),
            ),
            const SizedBox(height: 25),

            // Popular pizza list
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
              ),
              margin:
                  const EdgeInsets.only(left: 25, right: 25, bottom: 25),
              padding: const EdgeInsets.all(18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/pepperoni_pizza.png',
                        height: 60,
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pepperoni Pizza",
                            style: GoogleFonts.caveatBrush(fontSize: 18),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '\$12.99',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.favorite_outlined,
                    color: Color.fromARGB(255, 205, 40, 40),
                    size: 28,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      //  Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavTapped,
        selectedItemColor: primarycolor,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
        
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
