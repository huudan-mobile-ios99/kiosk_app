import 'package:flutter/material.dart';
import 'package:kiosk_new/utils/mycolors.dart';
import 'package:kiosk_new/utils/mystrings.dart';
import 'package:kiosk_new/widgets/image.asset.widget.dart';
import 'package:kiosk_new/widgets/texts.dart';

Widget backBtn({onPress, onPress2, isAutoPage}) {
  return InkWell(
    onTap: () {
      if (isAutoPage == false) {
        onPress();
      } else {
        onPress2();
      }
    },
    child: Container(
      alignment: Alignment.center,
      height: 55.0,
      width: 135.0,
      decoration: BoxDecoration(
        color: MyColor.bedge,
        borderRadius: BorderRadius.only(
          topLeft: isAutoPage == false
              ? const Radius.circular(StringFactory.padding032)
              : const Radius.circular(0),
          bottomRight: isAutoPage == false
              ? const Radius.circular(StringFactory.padding032)
              : const Radius.circular(0),
          topRight: isAutoPage == true
              ? const Radius.circular(StringFactory.padding032)
              : const Radius.circular(0),
          bottomLeft: isAutoPage == true
              ? const Radius.circular(StringFactory.padding032)
              : const Radius.circular(0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imageWithAsset(
              height: 35.0, width: 35.0, imagePath: StringFactory.logo_back),
          const SizedBox(
            width: StringFactory.padding,
          ),
          textCustom(isBold: true, text: 'BACK', size: 18.0)
        ],
      ),
    ),
  );
}
