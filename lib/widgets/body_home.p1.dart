import 'package:flutter/material.dart';
import 'package:kiosk_new/utils/mycolors.dart';
import 'package:kiosk_new/utils/mystrings.dart';
import 'package:kiosk_new/widgets/back.button.dart';
import 'package:kiosk_new/widgets/column.widget.dart';
import 'package:kiosk_new/widgets/divider.widge.dart';
import 'package:kiosk_new/widgets/row.widget.dart';
import 'package:kiosk_new/widgets/texts.dart';

Widget part1(
    {width,
    height,
    imagePath,
    pointCurrent,
    tierFrame,
    pointFrame,
    pointNextLevel,
    dailyPoint,
    pointDailyRLTB,
    pointWeekly,
    pointMonthly,
    pointDailySlot,
    onPressBack,
    context}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
        color: MyColor.white,
        borderRadius: BorderRadius.circular(StringFactory.padding032)),
    child: Row(
      children: [
        Container(
            margin: const EdgeInsets.all(StringFactory.padding032),
            height: height,
            width: width * .3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(StringFactory.padding016),
                color: MyColor.white.withOpacity(.35),
                image: DecorationImage(
                    image: AssetImage(imagePath), fit: BoxFit.fitHeight))),
        Expanded(
            child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(
                  top: StringFactory.padding032,
                  bottom: StringFactory.padding032,
                  right: StringFactory.padding032),
              decoration: const BoxDecoration(
                color: MyColor.white,
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  rowWidget(
                    widget1: textCustom(
                        text: "CURRENT POINT", isBold: true, size: 32.0),
                    widget2: textCustomNormalColor(
                        text: "$pointCurrent",
                        color: MyColor.pinkMain,
                        isBold: true,
                        size: 32.0),
                  ),
                  divider(StringFactory.padding020),
                  rowWidget(
                    widget1: textCustom(
                        text: "TIER FRAME", isBold: false, size: 20.0),
                    widget2: textCustomNormalColor(
                        text: "$tierFrame",
                        color: MyColor.pinkMain,
                        isBold: true,
                        size: 20.0),
                  ),
                  const SizedBox(
                    height: StringFactory.padding,
                  ),
                  rowWidget(
                    widget1: textCustom(
                        text: "POINT FRAME", isBold: false, size: 20.0),
                    widget2: textCustomNormalColor(
                        text: "$pointFrame",
                        color: MyColor.pinkMain,
                        isBold: true,
                        size: 20.0),
                  ),
                  const SizedBox(
                    height: StringFactory.padding,
                  ),
                  rowWidget(
                    widget1: textCustom(
                        text: "POINT TO NEXT LEVEL", isBold: false, size: 20.0),
                    widget2: textCustomNormalColor(
                        text: "$pointNextLevel",
                        color: MyColor.pinkMain,
                        isBold: true,
                        size: 20.0),
                  ),
                  divider(StringFactory.padding020),
                  rowWidget(
                    widget1: columnWidget(
                      widget1: textCustom(
                          text: "DAILY POINT", isBold: false, size:24),
                      widget2: textCustomNormalColor(
                          text: "$dailyPoint",
                          color: MyColor.pinkMain,
                          isBold: true,
                          size:24),
                    ),
                    widget2: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        rowWidget(
                          widget1: textCustom(
                            text: "DAILY SLOT: ",
                            isBold: false,
                            size:24,
                          ),
                          widget2: textCustomNormalColor(
                              text: "$pointDailySlot",
                              color: MyColor.pinkMain,
                              isBold: true,
                              size:24),
                        ),
                        const SizedBox(
                          height: StringFactory.padding,
                        ),
                        rowWidget(
                          widget1: textCustom(
                              text: "DAILY RL-TB: ", isBold: false, size:24),
                          widget2: textCustomNormalColor(
                              text: "$pointDailyRLTB",
                              color: MyColor.pinkMain,
                              isBold: true,
                              size:24),
                        ),
                      ],
                    ),
                    // columnWidget(
                    //   widget1: rowWidget(
                    //     widget1: textCustom(
                    //       text: "DAILY SLOT: ",
                    //       isBold: false,
                    //       size: 20,
                    //     ),
                    //     widget2: textCustomNormalColor(
                    //         text: "$pointDailySlot",
                    //         color: MyColor.pinkMain,
                    //         isBold: true,
                    //         size: 20),
                    //   ),
                    //   widget2: rowWidget(
                    //     widget1: textCustom(
                    //         text: "DAILY RL-TB: ", isBold: false, size: 20),
                    //     widget2: textCustomNormalColor(
                    //         text: "$pointDailyRLTB",
                    //         color: MyColor.pinkMain,
                    //         isBold: true,
                    //         size: 20),
                    //   ),
                    // )
                  ),
                  divider(StringFactory.padding020),
                  rowWidget(
                    widget1: columnWidget(
                      widget1: textCustom(
                          text: "WEEKLY POINT", isBold: false, size: 22),
                      widget2: textCustomNormalColor(
                          text: "$pointWeekly",
                          color: MyColor.pinkMain,
                          isBold: true,
                          size: 22),
                    ),
                    widget2: columnWidget(
                      widget1: textCustom(
                          text: "MONTHLY POINT", isBold: false, size: 22),
                      widget2: textCustomNormalColor(
                          text: "$pointMonthly",
                          color: MyColor.pinkMain,
                          isBold: true,
                          size: 22),
                    ),
                  ),
                  divider(StringFactory.padding020),
                ],
              ),
            ),
            Positioned(
                right: 0,
                bottom: 0,
                child: backBtn(
                    onPress2: () {},
                    isAutoPage: false,
                    onPress: () {
                      // Navigator.of(context).pushNamed('/welcome');
                      onPressBack();
                    }))
          ],
        ))
      ],
    ),
  );
}
