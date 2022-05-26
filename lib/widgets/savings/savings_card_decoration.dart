import 'package:flutter/material.dart';
import '../shared/best_image_size.dart';
import 'confetti_widget.dart';

List<Widget> stackDecoration() {
  return [
    Positioned(top: 0, child: selectImageBasedOnDeviceSize("arrow")),
    Positioned(top: 0, right: 0, child: selectImageBasedOnDeviceSize("star")),
    Positioned(
      bottom: 0,
      child: Align(
        alignment: Alignment.center,
        child: Row(
          children: [
            Container(
              width: 80,
              alignment: Alignment.bottomRight,
            ),
            selectImageBasedOnDeviceSize("heart")
          ],
        ),
      ),
    ),
    Positioned(
      bottom: 10,
      child: CustomConfettiWidget(),
    ),
  ];
}
