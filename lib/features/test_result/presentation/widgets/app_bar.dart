import 'package:flutter/material.dart';
import 'package:fittest/resources/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final AppColorsScheme colors;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.colors,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: colors.blockBackground,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: colors.headerText,
          fontFamily: "Raleway",
        ),
      ),
      iconTheme: IconThemeData(color: colors.headerText),
    );
  }
}