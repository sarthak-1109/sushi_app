import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/components/button.dart';
class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25,),
              Text('Experiments with Sushi',style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),),
              SizedBox(height: 40,),
              Center(child: Image.asset('assets/sushi2.png',width: 300,height: 250,)),
              SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Text('THE TASTE OF JAPANESE FOOD',style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(left:15,right: 15),
                child: Text('Sushi: The Wasabi of Your Heart',style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),),
              ),
              SizedBox(height: 15,),
              MyButton(text: 'Get Started',onTap: (){
                   Navigator.pushNamed(context, '/menupage');        // Go to Menu Page
              },),
              
            ],
          ),
        ),
      ),
    );
  }
}
