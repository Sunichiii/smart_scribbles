import 'package:flutter/material.dart';
import 'package:learn_to_write/Drawing%20board/drawing_board.dart';
import '../congrats_screen.dart';

class EasyLevelScreen extends StatefulWidget {
  final int currentDigit;

  const EasyLevelScreen({required this.currentDigit, super.key});

  @override
  State<EasyLevelScreen> createState() => _EasyLevelScreenState();
}

class _EasyLevelScreenState extends State<EasyLevelScreen> {
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LEARN [${widget.currentDigit}] "),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context); // goes back to the previous screen
          },
        ),
      ),

      body: Center(
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            const Text(
              "Trace and Learn",
              style: (TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset("lib/assets/images/image.png", height: 200),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20),
              child: Container(
                height: 350,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black87, width: 2)),
                child: DrawingBoard(onDrawingComplete: (List<Offset> points) {
                  setState(() {
                    isCompleted =
                        true; //setting to true when drawing is complete
                  });
                }),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                // if the user is in digit less than 10 , go to next digit
                if (isCompleted) {
                  if (widget.currentDigit < 10) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EasyLevelScreen(
                          currentDigit: widget.currentDigit + 1,
                        ),
                      ),
                    );
                  } else {
                    // if the user reaches the number 10 , go to screen with 'congratulations'
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CongratsScreen(),
                      ),
                    );
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isCompleted ? Colors.green[600] : Colors.blue,
                // color goes blue once the next button is clicked
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
              child: const Text(
                "Next",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      //floating action is used here to simulate user completing the task
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          setState(() {
            isCompleted =
                true; //setting the completion when the button is pressed
          });
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
