import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'fikra app ',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue[900],
        ),
        body: Center(
          child: Image(
            // image: NetworkImage(
            //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfiCxI2XTIClWSVI5sKtVKqjPCuULs9xZ7wuA22udKLA&s=10',
            // ),
            image: AssetImage('images/fikra.png'),
          ),
        ),
      ),
    ),
  );
}
