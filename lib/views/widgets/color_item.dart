import 'package:flutter/material.dart';
class ColorItem extends StatelessWidget {
  final bool isActive;
  final Color color;
  const ColorItem({required this.isActive, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: isActive
          ? CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: color,
              ),
            )
          : CircleAvatar(
              radius: 18,
              backgroundColor: color,
            ),
    );
  }
}