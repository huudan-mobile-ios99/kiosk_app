import 'package:flutter/material.dart';
import 'package:kiosk_new/utils/mycolors.dart';

Widget divider(paddingVertical) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: paddingVertical),
    child: const Divider(
      color: MyColor.grey_tab,
    ),
  );
}
