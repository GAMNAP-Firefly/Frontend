import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../theme/theme_bloc.dart';

class LightBulbIcon extends StatelessWidget {

  const LightBulbIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeCubit>().state.theme;
    LinearGradient gradient;
    switch (theme) {
      case AppTheme.dark:
        gradient = const LinearGradient(colors: [Color(0xFF8F00FF), Color(0xFF4B0082)]); // фиолетовый
        break;
      case AppTheme.red:
        gradient = const LinearGradient(colors: [Color(0xFFF49BA1), Color(0xFFF2AEAD)]); // розовый
        break;
      default:
        gradient = const LinearGradient(colors: [Colors.amber, Colors.yellow]);
    }
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
            return gradient.createShader(bounds);
          },
          child: const Icon(Icons.lightbulb, color: Colors.white),
        ),
        onPressed: () => context.read<ThemeCubit>().nextTheme(),
      ),
    );
  }
}
