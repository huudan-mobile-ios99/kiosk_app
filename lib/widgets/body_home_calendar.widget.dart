import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:intl/intl.dart';
import 'package:kiosk_new/getx/mycontroller.dart';
import 'package:kiosk_new/utils/mycolors.dart';
import 'package:kiosk_new/utils/mystrings.dart';
import 'package:kiosk_new/widgets/back.button.dart';
import 'package:kiosk_new/widgets/calendar.input.dart';
import 'package:kiosk_new/widgets/row.widget.dart';
import 'package:kiosk_new/widgets/shake.widget.dart';
import 'package:kiosk_new/widgets/texts.dart';

class BodyCalendarWidget extends StatefulWidget {
  double? height, width;
  String? imagePath, id;
  BuildContext? context;
  Callback? onPressBackBtn;
  Callback? onPressShake;
  Callback? onPressNotPicked;
  GlobalKey<ShakeWidgetState>? shakeKey;
  // Function? onPressCustomCheck, onPressPrint;
  BodyCalendarWidget(
      {super.key,
      this.width,
      this.id,
      this.shakeKey,
      this.height,
      this.onPressBackBtn,
      this.onPressShake,
      this.onPressNotPicked,
      // this.onPressCustomCheck,this.onPressPrint,
      this.imagePath,
      this.context});

  @override
  State<BodyCalendarWidget> createState() => _BodyCalendarWidgetState();
}

class _BodyCalendarWidgetState extends State<BodyCalendarWidget> {
  // final getX = Get.put(MyGetXController());
  final MyGetXController getX = Get.find();

  final formatterNum = NumberFormat();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          color: MyColor.white,
          borderRadius: BorderRadius.circular(StringFactory.padding032)),
      child: Row(
        children: [
          SizedBox(
              width: widget.width! * .625,
              height: widget.height,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        textCustom(
                            text: 'CUSTOM CHECK POINT',
                            size: 22,
                            isBold: false),
                        const SizedBox(
                          height: StringFactory.padding032,
                        ),
                        Obx(() => ShakeWidget(
                              key: widget.shakeKey!,
                              shakeCount: 5,
                              shakeOffset: 10,
                              shakeDuration: const Duration(milliseconds: 550),
                              child: textCustomNormalColor(
                                  text:
                                      formatterNum.format(getX.frameRangePoint.value),
                                  color: MyColor.pinkMain,
                                  isBold: true,
                                  size: 32),
                            ))
                      ],
                    ),
                  ),
                  Positioned(
                      top: StringFactory.padding032,
                      left: StringFactory.padding032,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() => calendarPicker(
                              text: "FROM: ${getX.pickCalendarValue1.value}",
                              onPress: () {
                                // print('id from widget: ${widget.id}');
                                getX.pauseTimers();
                                // print('calendar 1');
                                selectDate(
                                        onPressPicked: () {
                                          widget.onPressShake!();
                                          getX.overTheProcess();
                                        },
                                        id: widget.id,
                                        context: context,
                                        functionCancel: () {
                                          getX.overTheProcess();
                                        },
                                        isFirstPick: true)
                                    .then((value) {
                                  // print('completed picked 1st calendar');
                                  selectDate(
                                          onPressPicked: () {
                                            widget.onPressShake!();
                                            getX.overTheProcess();
                                          },
                                          onPressNotPicked: () {
                                            getX.overTheProcess();
                                          },
                                          functionCancel: () {
                                            getX.overTheProcess();
                                          },
                                          id: widget.id,
                                          context: context,
                                          isFirstPick: false)
                                      .then((value) {
                                    // print('completed picked 2nd calendar');
                                  });
                                });
                              })),
                          const SizedBox(
                            width: StringFactory.padding016,
                          ),
                          Obx(() => calendarPicker(
                              text: "TO: ${getX.pickCalendarValue2.value}",
                              onPress: () {
                                // print('pick calendar 2');
                                getX.pauseTimers();
                                selectDate(
                                        onPressPicked: () {
                                          widget.onPressShake!();
                                          getX.overTheProcess();
                                        },
                                        onPressNotPicked: () {
                                          getX.overTheProcess();
                                        },
                                        functionCancel: () {
                                          getX.overTheProcess();
                                        },
                                        id: widget.id,
                                        context: context,
                                        isFirstPick: false)
                                    .then((value) {
                                  // print('completed picked 2nd calendar');
                                  selectDate(
                                      onPressPicked: () {
                                        widget.onPressShake!();
                                        getX.overTheProcess();
                                      },
                                      id: widget.id,
                                      context: context,
                                      functionCancel: () {
                                        getX.overTheProcess();
                                      },
                                      isFirstPick: true);
                                });
                              })),
                        ],
                      )),
                  Positioned(
                      left: 0,
                      bottom: 0,
                      child: backBtn(
                          onPress2: () {
                            widget.onPressBackBtn!();
                          },
                          isAutoPage: true,
                          onPress: () {}))
                ],
              )),
          Expanded(
            child: Container(
                margin: const EdgeInsets.all(StringFactory.padding032),
                height: widget.height,
                // width: width * .3,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(StringFactory.padding016),
                    image: DecorationImage(
                        image: AssetImage(widget.imagePath!),
                        fit: BoxFit.fitHeight))),
          ),
        ],
      ),
    );
  }
}

Widget calendarPicker({
  text,
  onPress,
}) {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(
        vertical: StringFactory.padding, horizontal: StringFactory.padding016),
    width: 275,
    height: 55,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(StringFactory.padding032),
      color: MyColor.bedgeLight,
      border: Border.all(color: MyColor.grey_tab),
    ),
    child: rowWidgetCenter(
        widget1: textCustom(text: text, isBold: true, size: 16),
        widget2: InkWell(
            onTap: onPress,
            child: const Icon(
              Icons.calendar_month,
              size: 32,
            ))),
  );
}
