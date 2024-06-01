import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData lightTheme() {
    return ThemeData(
        useMaterial3: false,
        appBarTheme: AppBarTheme(
            elevation: 1,
            iconTheme: IconThemeData(color: Colors.blue.shade900),
            titleTextStyle: TextStyle(
              color: Colors.blue.shade900,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            backgroundColor: Colors.grey[300],
            actionsIconTheme: IconThemeData(
                color: Colors.blue.shade900
            )
        ),
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
            bodySmall: TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.grey[600],
                fontSize: 12
            ),
            bodyMedium: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 14,
                color: Colors.grey[600]
            ),
            titleLarge: const TextStyle(
                fontSize: 18,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w600,
                color: Colors.black
            )
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            showSelectedLabels: true,
            showUnselectedLabels: true,
            backgroundColor: Colors.grey[300],
            type: BottomNavigationBarType.fixed,
            elevation: 1,
            selectedItemColor: Colors.blue[900],
            unselectedItemColor: Colors.grey[500]
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: Colors.blue.shade800,
        )
    );
  }

}