import 'package:bulx_task_app/widgets/savings_widget.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Image.asset(
              "assets/images/logo.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
        body: SavingsWidget(),
      ),
      
    );
  }
}
