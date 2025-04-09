import 'package:flutter/material.dart';
import 'package:kiosk_new/utils/mystrings.dart';

Widget columnWidget({widget1,widget2}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      widget1,const SizedBox(height: StringFactory.padding,),widget2
    ],
  );
}
