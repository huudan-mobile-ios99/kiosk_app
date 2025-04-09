import 'package:flutter/material.dart';

Widget imageWithAsset({width, height, imagePath}) {
  return Container(
      width: width,
      height: height,
      decoration:
          BoxDecoration(image: DecorationImage(image: AssetImage(imagePath),fit: BoxFit.contain)));
}
