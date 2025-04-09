import 'package:flutter/material.dart';
import 'package:kiosk_new/utils/mystrings.dart';
import 'package:kiosk_new/widgets/body_home.p2.dart';
import 'package:kiosk_new/widgets/body_home_calendar.widget.dart';


Widget bodycalendar({onPressShake,onPressNotPicked,shakeKey,width, height,imagePath,context,id,onPressPrint,onPressCustomCheck,onPressBackBtn}) {
  final heightNew = height * 0.75;
  final widthNew = width - (StringFactory.padding032 * 2);
  final width1 = widthNew * 0.835 - StringFactory.padding032;
  final width2 = widthNew * 0.165 - StringFactory.padding048;
  return SizedBox(
    width: width,
    height: heightNew,
    child: Row(
      children: [
        part2(width: width2, height: heightNew,isAutoBtn: true,onPress:onPressPrint,onPressCustomCheck:onPressCustomCheck),
        BodyCalendarWidget(
          onPressShake: onPressShake,
          onPressNotPicked: onPressNotPicked,
          shakeKey:shakeKey,
          onPressBackBtn: onPressBackBtn, width: width1, id:id,height: heightNew, imagePath: imagePath,context:context),
      ],
    ),
  );
}




