import 'package:flutter/material.dart';
import 'package:kiosk_new/utils/mystrings.dart';
import 'package:kiosk_new/widgets/body_home.p1.dart';
import 'package:kiosk_new/widgets/body_home.p2.dart';

Widget body(
    {width,
    height,
    imagePath,
    pointCurrent,
    tierFrame,
    pointFrame,
    onPressCustomCheck,
    pointNextLevel,
    onPressPrint,
    dailyPoint,
    pointDailyRLTB,
    pointWeekly,
    pointMonthly,onPressBack,
    context,
    pointDailySlot}) {
  final heightNew = height * 0.75;
  final widthNew = width - (StringFactory.padding032 * 2);
  final width1 = widthNew * 0.835 - StringFactory.padding032;
  final width2 = widthNew * 0.165 - StringFactory.padding048;
  return SizedBox(
    width: width,
    height: heightNew,
    child: Row(
      children: [
        part1(
          context: context,
          width: width1,
          height: heightNew,
          imagePath: imagePath,
          pointCurrent: pointCurrent,
          tierFrame: tierFrame,
          pointMonthly: pointMonthly,
          pointNextLevel: pointNextLevel,
          pointWeekly: pointWeekly,
          dailyPoint: dailyPoint,
          pointFrame: pointFrame,
          pointDailyRLTB: pointDailyRLTB,
          pointDailySlot: pointDailySlot,
          onPressBack:onPressBack,
        ),
        part2(
            onPressCustomCheck: () {
              onPressCustomCheck();
            },
            width: width2,
            height: heightNew,
            isAutoBtn: false,
            onPress: () {
              onPressPrint();
            }),
      ],
    ),
  );
}
