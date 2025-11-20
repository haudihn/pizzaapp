import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/drink.dart';

class DrinkTile extends StatelessWidget {
  final Drink drink;
  const DrinkTile({
    super.key,
    required this.drink,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.only(left: 25),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          //image
          Image.asset(
            drink.imagePath,
            height: 140,
          ),

          //text
          Text(
            drink.name,
            style: GoogleFonts.caveatBrush(
              fontSize: 18,
            ),
          ),

          //price + rating
          SizedBox(
            width: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //price
                Text('\$${drink.price}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[700]),
                ),

                //rating
                Row(
                  children: [
                    Icon(
                  Icons.star, color: Colors.yellow[800],
                  ),
                Text(drink.rating, style: GoogleFonts.caveatBrush(color: Colors.grey),
                ),
                  ],
                )
              ],
           )
          ),
        ],
      ),
    );
  }
}