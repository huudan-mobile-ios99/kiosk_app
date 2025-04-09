import 'package:flutter/material.dart';
import 'package:kiosk_new/utils/mystrings.dart';
import 'package:kiosk_new/widgets/custom.button.dart';
import 'package:kiosk_new/widgets/print.button.dart';

Widget part2({width, height, isAutoBtn, onPress, onPressCustomCheck}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      isAutoBtn == false
          ? const SizedBox(
              width: StringFactory.padding048,
            )
          : Container(),
      SizedBox(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            customButton(width: width, height: height * .6, isAutoBtn: isAutoBtn,onPressCustomCheck: onPressCustomCheck),
            const SizedBox(
              height: StringFactory.padding048,
            ),
            Expanded(
                child: printButton(
                    width: width,
                    onPress: () {
                      onPress();
                    })),
          ],
        ),
      ),
      isAutoBtn == true
          ? const SizedBox(
              width: StringFactory.padding048,
            )
          : Container(),
    ],
  );
}
