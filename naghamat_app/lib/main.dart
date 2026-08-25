import 'package:flutter/material.dart';

void main() {
  runApp(MusicWidget());
}

class MusicWidget extends StatelessWidget {
  void playMusic(int musicNumber) {
    // Create an instance of AudioPlayer

    // Play the audio file based on the musicNumber
  }
  @override
  Widget build(BuildContext context) {
    Expanded myButton(int musicNumber, Color color, String nameOfMusic) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 0.8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            onPressed: () {
              playMusic(musicNumber);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Icon(Icons.music_note, color: color, size: 24.0),
                  SizedBox(width: 22.0),
                  Text(
                    nameOfMusic,
                    style: TextStyle(color: color, fontSize: 20.0),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return MaterialApp(
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.purple[300],
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'نغمات',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Arial',
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              Text(
                'لا يوجد تغمات مفعلة ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Arial',
                  fontSize: 24,
                  color: const Color.fromARGB(255, 252, 59, 45),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            myButton(1, Colors.blue, 'Samsung Galaxy'),
            const SizedBox(height: 0.2),
            myButton(2, Colors.teal, 'iphone 12 pro max'),
            const SizedBox(height: 0.2),
            myButton(3, Colors.deepPurpleAccent, 'infinix hot 12'),
            const SizedBox(height: 0.2),
            myButton(4, Colors.greenAccent, 'redmi note 12'),
            const SizedBox(height: 0.2),
            myButton(5, Colors.lightBlueAccent, 'ipad pro 2022'),
            const SizedBox(height: 0.2),
            myButton(6, const Color.fromARGB(255, 199, 199, 58), 'relme 9 pro'),
            const SizedBox(height: 0.2),
            myButton(
              7,
              const Color.fromARGB(255, 191, 90, 83),
              'hawawei p50 pro',
            ),
            const SizedBox(height: 0.2),
          ],
        ),
      ),
    );
  }
}
