import 'package:flutter/material.dart';

class ClockWidget extends StatelessWidget {
  const ClockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '08:00',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(
          'Min, 19 Jan 2025',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
