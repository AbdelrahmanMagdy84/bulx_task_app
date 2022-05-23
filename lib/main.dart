import 'package:bulx_task_app/screens/home_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Bulx',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.white,
            centerTitle: true,
            elevation: 0,
            toolbarHeight: 12.h,
          ),
          primarySwatch: Colors.blue,
        ),
        home: HomePageScreen(),
      );
    });
  }
}
