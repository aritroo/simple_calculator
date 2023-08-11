import 'package:flutter/material.dart';
import 'package:simple_calculator/screens/home.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: Colors.deepPurple.shade100,
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.deepPurple.shade100,
            ),
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: Home(),
        );
      },
    );
  }
}
