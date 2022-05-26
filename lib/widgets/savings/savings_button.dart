import 'package:flutter/material.dart';

class SavingsButton extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: const Text(
        "Tell a friend",
        style: TextStyle(fontFamily: "SFProText-Semibold", color: Colors.black),
      ),
      style: OutlinedButton.styleFrom(
        
        backgroundColor:  Colors.white,
        padding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(

          
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
