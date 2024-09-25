import 'package:flutter/material.dart';

class DifficultyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CHOOSE DIFFICULTY',
          style: TextStyle(
            fontSize: 28,
            color: Colors.grey[800],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.grey[800],
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 15), // Add small space between AppBar and Image

          Image.asset(
            'lib/assets/images/dify.png',
            width: 300,
          ),

          SizedBox(height: 20), // Space between image and buttons

          DifficultyButton(
            text: 'Easy ⭐\n Digits',
            color: Colors.blue,
            onPressed: () {
              Navigator.pushNamed(context, '/level1');
            },
          ),

          DifficultyButton(
            text: 'Medium ⭐⭐\nAlphabets',
            color: Colors.green,
            onPressed: () {
              Navigator.pushNamed(context, '/level2');
            },
          ),

          DifficultyButton(
            text: 'Hard ⭐⭐⭐\n Digits & Alphabets',
            color: Colors.red,
            onPressed: () {
              Navigator.pushNamed(context, '/level3');
            },
          ),
        ],
      ),
    );
  }
}

class DifficultyButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  DifficultyButton({required this.text, required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: double.infinity, // Make the button stretch across the screen
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color, // Use the passed color
            padding: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
