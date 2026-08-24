import 'package:flutter/material.dart';

import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          title: Text(
            'تطابق الصور',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.indigo[800],
        ),
        body: ImagePage(),
      ),
    ),
  );
}

class ImagePage extends StatefulWidget {
  const new({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  int leftImageNumber = 9;
  int rightImageNumber = 2;

  void changeNumOfImage() {
    leftImageNumber = Random().nextInt(9) + 1;
    rightImageNumber = Random().nextInt(9) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          leftImageNumber == rightImageNumber ? 'لقد نجحت' : 'حاول مرة أخرى',
          style: TextStyle(fontSize: 42.0, color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      changeNumOfImage();
                    });
                  },
                  child: Image.asset('images/image-$leftImageNumber.png'),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      changeNumOfImage();
                    });
                  },
                  child: Image.asset('images/image-$rightImageNumber.png'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
