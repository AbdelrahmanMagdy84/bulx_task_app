import 'package:flutter/material.dart';

class SavingsButton extends StatelessWidget {
  const SavingsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text(
        "Tell a friend",
        style: TextStyle(fontFamily: "SFProText-Semibold", color: Colors.black),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        padding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
