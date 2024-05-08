import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/components/shop.dart';
import 'package:sushi_app/themes/colors.dart';

import '../models/food.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  void removeFromcart(Food food, BuildContext context) {
    // Get access to shop
    final shop = context.read<Shop>();
    // remove from cart
    shop.removeFromcart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
        builder: (context, value, child) => Scaffold(
              backgroundColor: primaryColor,
              appBar: AppBar(
                title: Text('My Cart'),
                backgroundColor: primaryColor,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: value.cart.length,
                        itemBuilder: (context, index) {
                          // get food from cart
                          final Food food = value.cart[index];
                          // get food name
                          final String foodName = food.name;
                          // get food price
                          final String foodPrice = food.price;
                          // return ListTile
                          return Container(
                            decoration: BoxDecoration(color: Colors.redAccent),
                            margin:
                                EdgeInsets.only(left: 20, top: 20, right: 20),
                            child: ListTile(
                              title: Text(
                                foodName,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                foodPrice,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: IconButton(
                                onPressed: () => removeFromcart(food, context),
                                icon: Icon(Icons.delete),
                              ),
                            ),
                          );
                        }),
                  ),
                  MyButton(
                    text: 'Pay Now',
                    onTap: () {
                      Navigator.pushNamed(context, '/paymentpage');
                    },
                  )
                ],
              ),
            ));
  }
}
