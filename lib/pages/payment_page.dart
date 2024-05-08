import 'package:flutter/material.dart';
import 'package:sushi_app/themes/colors.dart';
import 'package:sushi_app/models/food.dart';
import 'package:sushi_app/components/food_tile.dart';
class PayPage extends StatefulWidget {
  PayPage({super.key});

  @override
  State<PayPage> createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  final List<String> _paymentTypes = ['Credit Card', 'PayPal', 'Bank Transfer'];

  // The currently selected payment type
  String? _selectedPaymentType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pay Now',style: TextStyle(
          color: Colors.blueAccent,

        ),),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: primaryColor,
      body:
      Stack(
          children: [
      Container(
      decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/wall2.jpg'), // Replace 'background.jpg' with your image file
      fit  : BoxFit.cover,
    ),
    ),
    ),
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Payment Details',style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),),
            ),
            SizedBox(height: 12,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Email Address',style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 15,right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '電子メールアドレス',
                ),
              ),
            ),
            SizedBox(height: 12,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Phone Number',style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),),
            ),
        
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 15,right: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '電話番号。',
                ),
              ),
            ),
            SizedBox(height: 12,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Delivery Address',style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 15,right: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '配送先住所',
                ),
              ),
            ),
            SizedBox(height: 12,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Payment Method',style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),),
            ),
        
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 15,right: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
              ),
            child: DropdownButton<String>(
            hint: Text('Select Payment Type'),
            value: _selectedPaymentType,
            onChanged: (newValue) {
            setState(() {
            _selectedPaymentType = newValue;
            });
            },
            items: _paymentTypes.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
            );
            }).toList(),
            ),
            ),
            SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Item Total'),
                Text('\$'),
              ],
            )
          ],
        ),
      ),
    ]
      )
    );
  }
}
