import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:http/http.dart';
import 'package:kiosk_new/functions/stringtodate.dart';
import 'package:kiosk_new/getx/mycontroller.dart';
import 'package:kiosk_new/models/status.range.dart';
import 'package:kiosk_new/services/myservices.api.dart';
import 'package:kiosk_new/utils/mycolors.dart';
import 'package:kiosk_new/utils/mystringformats.dart';
import 'package:kiosk_new/widgets/toasts.dart';

final today = DateTime.now();

final formatString = StringFormat();
Future<void> selectDate({
  id,
  required BuildContext context,
  functionCancel,
  MyGetXController? getX,
  onPressPicked,
  onPressNotPicked,
  bool? isFirstPick,
}) async {
  // final getX = Get.put(MyGetXController());
  final MyGetXController getX = Get.find();

  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: today,
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          splashColor: MyColor.bedge,
          primaryColor: Colors.white,
          colorScheme: isFirstPick == true
              ? const ColorScheme.light(
                  primary: Colors.orangeAccent, // header background color
                  onPrimary: Colors.black, // header text color
                  onSurface: Colors.black,
                  // body text color
                )
              : const ColorScheme.light(
                  primary: Colors.orange, // header background color
                  onPrimary: Colors.black, // header text color
                  onSurface: Colors.black, // body text color
                ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              textStyle:  TextStyle(color: Colors.black),
              backgroundColor: Colors.white, // Background color
            ),
          ),
          primaryTextTheme: TextTheme(
            
          ),
          textSelectionTheme: TextSelectionThemeData(
           
          )
        ),
        child: child!,
      );
    },
    firstDate: DateTime(today.year - 2, 1, 1),
    lastDate: today,
    // lastDate: DateTime(today.year, 12, 31)
  );
  if (picked != null) {
    isFirstPick == true
        ? getX.savePicker(formatString.formatDate(picked))
        : getX.savePicker2(formatString.formatDate(picked));
    // print(getX.pickCalendarValue1.value);
    // print(getX.pickCalendarValue2.value);
    if (!getX.pickCalendarValue1.value.isEmpty &&
        !getX.pickCalendarValue2.value.isEmpty) {
      getFramePoint(
          onPressPicked: onPressPicked,
          id: id,
          getX: getX,
          startDate: convertStringToDate(getX.pickCalendarValue1.value),
          endDate: convertStringToDate(getX.pickCalendarValue2.value));
    }
  } else if (picked == null) {
    // print('picked null - calendar');
    functionCancel();
  } else {
    // print('calendar cancel btn');
    functionCancel();
  }
}

final service = ServiceAPIs();
getFramePoint({
  DateTime? startDate,
  DateTime? endDate,
  id,
  MyGetXController? getX,
  onPressPicked,
}) {
  final isBefore = startDate!.isBefore(endDate!);
  final isEqual = startDate.isAtSameMomentAs(endDate);
  if (startDate == endDate ||
      startDate == DateTime(2020, 01, 01) ||
      endDate == DateTime(2020, 01, 01)) {
    // debugPrint('nothing was select');
    // getX!.saveShakeWidget(false);
    getX?.frameRangePoint.value = 0;

    onPressPicked();
    showToast('please select dates'.toUpperCase());
  } else {
    if (isEqual == false || isBefore == true) {
      // getX!.saveShakeWidget(true);
      onPressPicked();
      // debugPrint('date > date2 ${id} ${formatString.formatDate(startDate)} ${formatString.formatDate(endDate)}');
      service
          .postPointCardTrackRange(
              id: id,
              startDate: formatString.formatDate(startDate),
              endDate: formatString.formatDate(endDate))
          .then((value) {
        StatusRange model = value;
        if (model.status == true) {
          getX!.saveFrameRangePoint(model.data.loyaltyPointsFrame);
        }
        // print('point:${model.data.loyaltyPointsFrame}');
      });
    }
    if (isEqual == true || isBefore == false) {
      // getX!.saveShakeWidget(false);
      getX?.frameRangePoint.value = 0;
      onPressPicked();
      // print('is equal');
      service
          .postPointCardTrackRange(
              id: id,
              startDate: formatString.formatDate(startDate),
              endDate: formatString.formatDate(endDate))
          .then((value) {
        StatusRange model = value;
        if (model.status == true) {
          getX!.saveFrameRangePoint(model.data.loyaltyPointsFrame);
        }
        // print('${model.data.loyaltyPointsFrame}');
      });
    }
    if (isEqual == false && isBefore == false) {
      // debugPrint('is before <');
      showToast('please choose date start < date end'.toUpperCase());
    }
  }
}
