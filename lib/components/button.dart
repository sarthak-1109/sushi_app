import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const MyButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red[200],
          borderRadius: BorderRadius.circular(20)
        ),
        width: double.infinity,

        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text,style: TextStyle(
                color: Colors.white
              ),),
              SizedBox(width:10),
              Icon(Icons.arrow_forward,color: Colors.white,)
            ],
          ),
        ),
      ),
    );
  }
}
