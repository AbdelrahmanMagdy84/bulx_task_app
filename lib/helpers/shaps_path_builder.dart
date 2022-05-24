import 'dart:math';

import 'package:flutter/material.dart';

void pathBuilder(Path path) {
  var size = const Size(20, 20);
  path.moveTo(size.width * 0.0612500, size.height * 0.4860000);
  path.quadraticBezierTo(size.width * 0.1281250, size.height * 0.4920000,
      size.width * 0.1675000, size.height * 0.4900000);
  path.cubicTo(
      size.width * 0.1762500,
      size.height * 0.4535000,
      size.width * 0.2115625,
      size.height * 0.3805000,
      size.width * 0.2537500,
      size.height * 0.3800000);
  path.cubicTo(
      size.width * 0.3140625,
      size.height * 0.4130000,
      size.width * 0.3359375,
      size.height * 0.5620000,
      size.width * 0.3925000,
      size.height * 0.6200000);
  path.cubicTo(
      size.width * 0.4818750,
      size.height * 0.5055000,
      size.width * 0.4946875,
      size.height * 0.4395000,
      size.width * 0.5275000,
      size.height * 0.4080000);
  path.cubicTo(
      size.width * 0.6040625,
      size.height * 0.5225000,
      size.width * 0.6318750,
      size.height * 0.5680000,
      size.width * 0.6800000,
      size.height * 0.5840000);
  path.cubicTo(
      size.width * 0.7093750,
      size.height * 0.5380000,
      size.width * 0.7456250,
      size.height * 0.4100000,
      size.width * 0.7975000,
      size.height * 0.4000000);
  path.cubicTo(
      size.width * 0.8128125,
      size.height * 0.4215000,
      size.width * 0.8434375,
      size.height * 0.4645000,
      size.width * 0.8587500,
      size.height * 0.4860000);
  path.quadraticBezierTo(size.width * 0.8790625, size.height * 0.5050000,
      size.width * 0.9750000, size.height * 0.4980000);
  path.lineTo(size.width * 0.9762500, size.height * 0.5460000);
  path.lineTo(size.width * 0.8562500, size.height * 0.5400000);
  path.quadraticBezierTo(size.width * 0.8103125, size.height * 0.5075000,
      size.width * 0.8000000, size.height * 0.4540000);
  path.cubicTo(
      size.width * 0.7643750,
      size.height * 0.4865000,
      size.width * 0.7268750,
      size.height * 0.5455000,
      size.width * 0.6875000,
      size.height * 0.6560000);
  path.cubicTo(
      size.width * 0.6062500,
      size.height * 0.5965000,
      size.width * 0.5587500,
      size.height * 0.5375000,
      size.width * 0.5275000,
      size.height * 0.4640000);
  path.cubicTo(
      size.width * 0.5190625,
      size.height * 0.5180000,
      size.width * 0.4871875,
      size.height * 0.5710000,
      size.width * 0.4125000,
      size.height * 0.6560000);
  path.cubicTo(
      size.width * 0.3340625,
      size.height * 0.7105000,
      size.width * 0.2796875,
      size.height * 0.4275000,
      size.width * 0.2500000,
      size.height * 0.4320000);
  path.quadraticBezierTo(size.width * 0.2318750, size.height * 0.4175000,
      size.width * 0.1787500, size.height * 0.5220000);
  path.lineTo(size.width * 0.0600000, size.height * 0.5220000);
  path.lineTo(size.width * 0.0612500, size.height * 0.4860000);
  path.close();
}

void starPathBuilder(Path path, double Function(double) degToRad) {
  var size = const Size(10, 10);
  const numberOfPoints = 5;
  final halfWidth = size.width / 2;
  final externalRadius = halfWidth;
  final internalRadius = halfWidth / 2.5;
  final degreesPerStep = degToRad(360 / numberOfPoints);
  final halfDegreesPerStep = degreesPerStep / 2;
  final fullAngle = degToRad(360);

  path.moveTo(size.width, halfWidth);
  for (double step = 0; step < fullAngle; step += degreesPerStep) {
    path.lineTo(halfWidth + externalRadius * cos(step),
        halfWidth + externalRadius * sin(step));
    path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
        halfWidth + internalRadius * sin(step + halfDegreesPerStep));
  }
}
