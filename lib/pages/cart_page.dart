
import 'package:flutter/material.dart';
import 'package:pizza_app/components/button.dart';
import 'package:pizza_app/models/food.dart';
import 'package:provider/provider.dart';
import 'package:pizza_app/models/shop.dart';
import 'package:pizza_app/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //remove from cart
  void removeFromCart(Food food, BuildContext context) {
    //get acces to the shop
    final shop = context.read<Shop>();

    //remove from cart
    shop.removeFromCart(food);

  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: primarycolor,
        appBar: AppBar(
          title: const Text('My Cart'),
          elevation: 0,
          backgroundColor: primarycolor,
        ),
        body: Column(
          children: [
            //customer cart
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  //get food from cart
                  final Food food = value.cart[index];
              
                  //get food name
                  final String foodName = food.name;
              
                  //get food price
                  final double foodPrice = food.price;
              
                  //return list tile
                  return Container(
                    decoration: BoxDecoration(color: secondarycolor, 
                     borderRadius: BorderRadius.circular(10),),
                    margin: const EdgeInsets.all(15),
                    child: ListTile(
                      title: Text(foodName, 
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                       ),
                      ),
              
                      subtitle: Text(foodPrice.toStringAsFixed(2),
                      style:  TextStyle(
                        color: Colors.grey[200],
                
                       ),
                       ),
              
                      trailing: IconButton(
                        icon:  Icon(
                          Icons.delete, 
                          color: Colors.grey[300],
                        ), 
                         onPressed: () =>removeFromCart(food, context)),
                    ),
                  );
                }
                         ),
            ),
           //pay button
           Padding(
             padding: const EdgeInsets.all(25.0),
             child: MyButton(text: "Pay Now"
             , onTap: (){}
             ),
           ),

          ],
        ),
    ),
    );
  }
} 