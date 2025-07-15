import 'package:flutter/material.dart';

class LightBulbIcon extends StatelessWidget {

  const LightBulbIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(6),
      child: IconButton(
        icon: ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: [Colors.amber, Colors.yellow],
            ).createShader(bounds);
          },
          child: const Icon(Icons.lightbulb, color: Colors.white),
        ),
        onPressed: () {},
      ),
    );
  }
}
