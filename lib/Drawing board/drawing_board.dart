import 'dart:ui' as ui;
import 'package:flutter/material.dart';

// A widget that provides a drawing board where users can draw.
class DrawingBoard extends StatefulWidget {
  // A callback function that is called when the drawing is complete.
  final Function(List<Offset>) onDrawingComplete;

  const DrawingBoard({required this.onDrawingComplete, Key? key}) : super(key: key);

  @override
  _DrawingBoardState createState() => _DrawingBoardState();
}

class _DrawingBoardState extends State<DrawingBoard> {
  // List to hold the points where the user has drawn.
  List<Offset?> points = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // This method is called when the user drags their finger on the screen.
      onPanUpdate: (details) {
        setState(() {
          // Get the render box and convert the global position to local coordinates.
          RenderBox renderBox = context.findRenderObject() as RenderBox;
          Offset localPosition = renderBox.globalToLocal(details.globalPosition);

          // making sure the drawing is inside the drawing board only
          if (localPosition.dx >= 0 && localPosition.dx <= renderBox.size.width &&
              localPosition.dy >= 0 && localPosition.dy <= renderBox.size.height) {
            points.add(localPosition);
          }
        });
      },
      // This method is called when the user lifts their finger off the screen.
      onPanEnd: (details) {
        // Call the function passed to this widget when drawing is complete.
        widget.onDrawingComplete(points.where((point) => point != null).cast<Offset>().toList());
        points.add(null); // Add a null to indicate a break in the line for new strokes.
      },
      child: CustomPaint(
        size: const Size(double.infinity, 300), // Define the size of the drawing area.
        painter: DrawingPainter(points), // Use the custom painter to draw the points.
      ),
    );
  }
}

// A custom painter that draws the lines on the canvas.
class DrawingPainter extends CustomPainter {
  final List<Offset?> points; // List of points to draw.

  DrawingPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    // Loop through the points and draw lines between them.
    for (int i = 0; i < points.length - 1; i++) {
      // Ensure the current and next points are not null before drawing.
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint); // Draw the line between the two points.
      }
    }
  }

  @override
  bool shouldRepaint(DrawingPainter oldDelegate) => true; // Return true to repaint when points change.
}
