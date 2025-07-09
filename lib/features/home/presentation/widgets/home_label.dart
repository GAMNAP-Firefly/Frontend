import 'package:flutter/material.dart';
import 'package:fittest/resources/strings.dart';

class HomeLabel extends StatelessWidget {
  const HomeLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 1,
                offset: Offset(0, 4),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 1),
          child: Text(
            Strings.title,
            style: TextStyle(fontSize: 25, color: Color(0xFF737E8A)),
          ),
        ) ],
    );
  }
}
