import 'package:flutter/material.dart';

class ItemSlider1Widget extends StatelessWidget {
  String image;

  ItemSlider1Widget({
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 10.0),
      width: 180,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white10,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            image,
          ),
        ),
      ),
    );
  }
}