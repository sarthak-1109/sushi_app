import 'package:flutter/material.dart';

class CustomDrawerPage extends StatelessWidget {
  const CustomDrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Our Services',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            title: Text('Japan'),
          )
        ],
      ),
    );
  }
}
