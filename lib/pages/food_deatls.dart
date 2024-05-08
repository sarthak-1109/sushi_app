import 'package:flutter/material.dart';
import 'package:sushi_app/components/blinking_state.dart';
import 'package:sushi_app/models/food.dart';
import 'package:sushi_app/themes/colors.dart';

import '../components/button.dart';
import '../components/shop.dart';

class FoodDetails extends StatefulWidget {
  final Food food;
  const FoodDetails({super.key, required this.food});

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  int quantity = 0;
  void decrementQuantity() {
    setState(() {
      if (quantity > 0) {
        quantity = quantity - 1;
      }
    });
  }

  void incrementQuantity() {
    setState(() {
      quantity = quantity + 1;
    });
  }

  void addTocart() {
    if (quantity > 0) {
      final shop = Shop();
      //final shop = context.read<Shop>(); // Get access to shop
      shop.addTocart(widget.food, quantity); // ADD TO CART
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: primaryColor,
          content: Text(
            'Succesfully added to cart',
            style: TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ), // let the user know that the item is added to the cart
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(
                      context); // Dialog box will get clos// Go back to previous screen
                },
                icon: Icon(Icons.done))
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
        foregroundColor: Colors.grey,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cartpage');
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: ListView(
              children: [
                Image.asset(
                  widget.food.imagePath,
                  height: 200,
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    BlinkingState(),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      widget.food.rating,
                      style: TextStyle(
                          color: Colors.blueGrey, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.food.name,
                  style: TextStyle(
                      color: Colors.blueGrey, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 25,
                ),
                Text('Description'),
                SizedBox(
                  height: 10,
                ),
                Text(widget.food.description),
              ],
            ),
          )),
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
            ),
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$" + (widget.food.price),
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: decrementQuantity,
                              icon: Icon(
                                Icons.remove,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 10,
                            child: Text(
                              quantity.toString(),
                              style: TextStyle(
                                color: Colors.white70,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: incrementQuantity,
                              icon: Icon(
                                Icons.add,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                MyButton(
                  text: 'Add to Cart',
                  onTap: addTocart,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
