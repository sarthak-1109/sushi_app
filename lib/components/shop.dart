import 'package:flutter/cupertino.dart';

import '../models/food.dart';

class Shop extends ChangeNotifier{
  final List<Food> _foodMenu=[
    Food(name: 'Salmon Sushi', price: '10.0', imagePath:'assets/sushi1.png', rating: '4.9',description:'he star ingredient of salmon sushi is, of course, salmon. The salmon used in sushi is usually fresh and high-quality. ' ),
    Food(name: 'Tuna', price:'40.0', imagePath:'assets/sushi4.png', rating: '4.7',description:'Tuna used in sushi is typically sourced from different species of tuna, including bluefin tuna, yellowfin tuna (also known as ahi tuna), and bigeye tuna.' ),
    Food(name: 'Afghani Sushi', price: '60.0', imagePath:'assets/afghani.png', rating: '4.3',description: 'Thinly sliced cooked lamb or beef, marinated with Afghani spices such as coriander, cumin, and turmeric'),
    Food(name: 'Chilly Sushi', price: '80.0', imagePath: 'assets/chilly.png', rating: '4.2',description: ' Thinly sliced garlic cloves and chili flakes or add thinly sliced chili peppers on top of the fillings for an extra kick of flavor and heat.'),
    Food(name: 'Sushi Mushi', price: '90.0', imagePath: 'assets/mushi.png', rating: '5.0',description:'A popular special sushi roll that typically includes eel (unagi) and avocado inside the roll, topped with thin slices of avocado to resemble dragon scales.' ),
    Food(name: 'Achari Sushi', price: '70.0', imagePath: 'assets/achari.png', rating: '3.0',description:'Fusion dish combining elements of Japanese sushi with flavors inspired by Indian cuisine, particularly achar, which is a type of Indian pickle known for its tangy and spicy flavor profile.' ),
  ];
  List<Food> _cart=[];
  List<Food> get foodMenu=>_foodMenu;
  List<Food> get cart=>_cart;
  void addTocart(Food foodItem,int quantity){
    for(int i=0;i<quantity;i++){
      _cart.add(foodItem);
    }
    notifyListeners();
  }
  void removeFromcart(Food food){
      _cart.remove(food);
      notifyListeners();
  }

}