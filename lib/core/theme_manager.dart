import 'package:flutter/material.dart';

class ThemeManager {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        toolbarHeight: 100,
        titleTextStyle:TextStyle(color: Colors.black,fontSize: 28,fontWeight:FontWeight.bold),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.grey,size: 27),

      ),
    );
  }
}
