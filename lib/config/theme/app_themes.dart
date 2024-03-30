import 'package:flutter/material.dart';

/// Function that returns a ThemeData object which encapsulates the colors, type styles, and shapes.
/// Used for customizing the visual appearance of the app.
ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Muli',
    appBarTheme: appBarTheme(),
  );
}

/// Function that returns an AppBarTheme object which encapsulates the colors, type styles, and shapes
/// used for customizing the visual appearance of the AppBar widget.
AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Color(0XFF8B8B8B)),
    titleTextStyle: TextStyle(
      color: Color(0XFF8B8B8B),
      fontSize: 18,
    ),
  );
}