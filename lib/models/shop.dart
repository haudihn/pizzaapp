import 'package:flutter/material.dart';
import 'package:pizza_app/models/food.dart';


class Shop extends ChangeNotifier{

   //food menu
  final List<Food> _foodMenu = [
    Food(
        name: "Cheese Pizza",
        price: 10.99,
        imagePath: "assets/images/cheese_pizza.png",
        rating: "4.8"),
    Food(
        name: "Pepperoni Pizza",
        price: 12.99,
        imagePath: "assets/images/pepperoni_pizza.png",
        rating: "4.9"),
    Food(
        name: "Chicken Pizza",
        price: 11.99,
        imagePath: "assets/images/chicken_pizza.png",
        rating: "4.8"),
    Food(
        name: "Mushroom Pizza",
        price: 9.99,
        imagePath: "assets/images/mushroom_pizza.png",
        rating: "4.7"),
    Food(
        name: "Pineapple Pizza",
        price: 10.99,
        imagePath: "assets/images/pineapple_pizza.png",
        rating: "4.7"),
    Food(
        name: "Zaitun Pizza",
        price: 11.99,
        imagePath: "assets/images/zaitun_pizza.png",
        rating: "4.6"),
  ];

  //customer cart
   List<Food> _cart = [];

  // getter method for cart
   List<Food> get foodMenu => _foodMenu;
   List<Food> get cart => _cart;

  // add to cart method
    void addToCart(Food foodItem, int quantity) {
      for (int i = 0; i < quantity; i++) {
        _cart.add(foodItem);
      }
      notifyListeners();
    }
   
  //remove from cart method
    void removeFromCart(Food food) {
      _cart.remove(food);
      notifyListeners();
    }
 }