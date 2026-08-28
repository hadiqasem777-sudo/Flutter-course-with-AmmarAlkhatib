import 'package:electrical_stor_app/widget/home/home_body.dart';
import 'package:flutter/material.dart';
import 'package:electrical_stor_app/constants.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: homeAppBar(),
      body: HomeBody(),
    );
  }
}

AppBar homeAppBar(){
  return AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        title: Text("مرحباً بكم في متجر الإلكترونيات ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: false,
        actions: [
          IconButton(
            style: IconButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: Icon(Icons.menu),
            onPressed: () {
              // Action for menu button
            },
          ),
        ],
      );
}
