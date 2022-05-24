import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Image selectImageBasedOnDeviceSize(String imageName, [double? width]) {
  String imageSize = "";

  if (SizerUtil.width >= 500) {
    imageSize = "@3x";
  } else if (SizerUtil.width > 360) {
    imageSize = "@2x";
  } else if (SizerUtil.width <= 360) {
    imageSize = "";
  }

  return Image.asset(
    "assets/images/$imageName$imageSize.png",
    fit: BoxFit.scaleDown,
    width: width,
  );
}
