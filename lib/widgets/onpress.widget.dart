import 'package:flutter/material.dart';
import 'package:kiosk_new/utils/mycolors.dart';

Widget customPressButton({padding,onPress,width,child}){
  return ClipRRect(
    borderRadius: BorderRadius.circular(padding),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: MyColor.pinkMain,
        onTap: ()=>onPress(),
        child: child
      ),
    ),
  );
}