import 'package:flutter/material.dart';
import 'package:kiosk_new/utils/mycolors.dart';
import 'package:kiosk_new/utils/mystrings.dart';
import 'package:kiosk_new/widgets/onpress.widget.dart';

Widget printButton({width, onPress}) {
  return customPressButton(
    padding: StringFactory.padding032,
    onPress: ()=>onPress(),
    child: Container(
        width: width,
        decoration: BoxDecoration(
            color: MyColor.white.withOpacity(.8),
            borderRadius: BorderRadius.circular(StringFactory.padding032)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: 75,
              width: 75,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(StringFactory.logo_print))),
            ),
            const SizedBox(
              height: StringFactory.padding,
            ),
            const Text('PRINT',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0, color: MyColor.grey))
          ],
        ),
    ),
  );
}
