import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pizza_app/components/button.dart';
import 'package:pizza_app/models/food.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_app/models/shop.dart';
import 'package:pizza_app/theme/colors.dart';
import 'package:pizza_app/components/button.dart';
import 'package:pizza_app/pages/home_page.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
  }

class _FoodDetailsPageState extends State<FoodDetailsPage> {

  //quantity
  int quantityCount = 0;

  //decrement quantity
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  //increment quantity
  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  //add to cart
  void addTocart() {
    // only add if quantity > 0
    if (quantityCount > 0) {
      // get acces to the shop
      final shop = context.read<Shop>();

      // add to cart
      shop.addToCart(widget.food, quantityCount);

      // let the user know
      showDialog(
        context: context, 
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: primarycolor,
        content: Text(
          "Successfully added to cart!", 
          style: TextStyle(color: Colors.white), 
          textAlign: TextAlign.center,
          ),
          //okay button
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.done,
               color: Colors.white,
               ),
            ),
          ],
         ),
        );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: const Color.fromARGB(255, 122, 0, 0),
      ),
      body: Column(
        children: [
          //listview of pizza detail
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
              //image
              Image.asset(
                widget.food.imagePath,
                height: 200,
                ),
              
               const SizedBox(height: 25),
              
              //rating
              Row(
                children: [
                  //star icon
                  Icon(
                    Icons.star, color: Colors.yellow[800],
                    ),
                    const SizedBox(width: 5),
              
                    //rating number
                    Text(
                      widget.food.rating, 
                      style: TextStyle(
                        color: Colors.grey[600], 
                        fontWeight: FontWeight.bold
                     ),
                    ),
                  ],
              ),
              const SizedBox(height: 10),
              
              //pizza name
              Text(
                widget.food.name, 
                style: GoogleFonts.caveatBrush(fontSize: 28),
               ),

              const SizedBox(height: 25),
              
              //description
              Text(
                "Deskripsi",
               style: TextStyle(
                color: Colors.grey[900],
                fontWeight: FontWeight.bold,
                fontSize: 18,
               ),
              ),
              
              const SizedBox(height: 10),

              Text(
                "Pizza adalah hidangan Italia yang terdiri dari adonan pipih yang diberi saus (biasanya tomat) dan keju, lalu dipanggang dalam oven bersuhu tinggi. Seiring waktu, pizza telah berkembang menjadi makanan global dengan berbagai varian topping dan gaya regional. Makanan ini identik dengan rasanya yang gurih, tekstur roti yang matang, serta lelehan keju yang kaya. ",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                  height: 2,
                ),
              ),

              ],
            ),
          ),
          ),
          
          //price + quantity + add to cart button
          Container(
            color: primarycolor,
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
        
                //price + quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //price
                    Text(
                      "\$${widget.food.price}", 
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    //quantity
                    Row(
                      children: [
                        //minus button
                        Container(
                          decoration: BoxDecoration(
                            color: secondarycolor,
                            shape: BoxShape.circle,
                            
                          ),
                          child: IconButton(
                            icon:  Icon(Icons.remove, color: Colors.white,),
                            onPressed: decrementQuantity,
                          ),
                        ),

                        //quantity count
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(quantityCount.toString(), 
                            style: const TextStyle(
                              color: Colors.white, 
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              ),
                              ),
                          ),
                        ),


                        //plus button
                         Container(
                          decoration: BoxDecoration(
                            color: secondarycolor,
                            shape: BoxShape.circle,
                            
                          ),
                          child: IconButton(
                            icon:  Icon(Icons.add, color: Colors.white,),
                            onPressed: incrementQuantity,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 25),

                //button add to cart
                MyButton(text: "Add to Cart", onTap: addTocart ),
              ],
                
            ),
          ),
        ],
      ),
    );
  }
}