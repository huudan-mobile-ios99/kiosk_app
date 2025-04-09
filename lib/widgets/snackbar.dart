import 'package:flutter/material.dart';
import 'package:kiosk_new/utils/mycolors.dart';
import 'package:kiosk_new/widgets/texts.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> customSnackBar({context,String? message}){
   final snackBar = SnackBar(
    backgroundColor: MyColor.grey_tab,
    duration: const Duration(seconds: 1),
    showCloseIcon: true,
    closeIconColor: MyColor.black_text,
    content: textCustomColor(text:'$message!',isBold: true,size:16.0,color: MyColor.black_text),
);
  return   ScaffoldMessenger.of(context).showSnackBar(snackBar);
}