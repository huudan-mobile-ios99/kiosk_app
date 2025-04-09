import 'dart:async';
import 'package:get/get.dart';
import 'package:kiosk_new/models/users.dart';
import 'package:kiosk_new/pages/welcome.dart';

class MyGetXController extends GetxController {
  RxInt valueRate = 0.obs;
  var user = Rxn(User);
  RxString pickCalendarValue1 = ''.obs;
  RxString pickCalendarValue2 = ''.obs;
  RxInt frameRangePoint = 0.obs;

  RxInt valueAwait = 10.obs;
  RxInt valueAwait2 = 45.obs;
  RxBool isShowBadge = false.obs;
  Timer? _countdownTimer, _countdownTimer2;
  RxBool isShakeWidget = false.obs;
  @override
  void onInit() {
    print('getx init');
    super.onInit();
  }

  @override
  void onReady() {
    print('getx ready');
    super.onReady();
  }

  @override
  void onClose() {
    _countdownTimer!.cancel(); // Cancel the timer when the controller is disposed
    _countdownTimer2!.cancel();
    valueAwait.value = 0;
    isShowBadge.value = false;
    valueAwait2.value = 0;

    pickCalendarValue1.value = '';
    pickCalendarValue2.value = '';
    frameRangePoint.value = 0;

    super.onClose();
  }

  //dispose and reset value picker&frame point
  void resetPickFramePoint() {
    pickCalendarValue1.value = '';
    pickCalendarValue2.value = '';
    frameRangePoint.value = 0;
  }

  void resetTimer() {
    // Stop and reset the first timer
    _countdownTimer?.cancel();
    valueAwait.value = 10;
    // Stop and reset the second timer
    _countdownTimer2?.cancel();
    valueAwait2.value = 45;
    // Reset the badge status
    isShowBadge.value = false;
  }

  //Timer Add
  void startCountdownTimer() {
    isShowBadge.value = false;
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (valueAwait.value > 0) {
        valueAwait.value = valueAwait.value - 1;
        // print(valueAwait.value);
      } else {
        timer.cancel(); // Stop the timer when valueAwait reaches 0
        valueAwait.value = 10; // Restart the countdown by resetting valueAwait to 10
        // Restart the countdown by resetting valueAwait to 10
        isShowBadge.value = true;
        startCountdownTimer2(); // Start the countdown again
      }
      if (valueAwait.value == 0) {
        // If valueAwait reaches 0, navigate to WelcomeScreen
        isShowBadge.value = false;
        // Replace the current route with WelcomeScreen
        Get.offAll(const WelcomePage(), transition: Transition.fade);
        resetPickFramePoint();
      }
    });
  }

  void startCountdownTimer2() {
    valueAwait2.value = 45;
    isShowBadge.value = true;
    const oneSecond = Duration(seconds: 1);
    _countdownTimer2 = Timer.periodic(oneSecond, (timer) {
      if (valueAwait2.value > 0) {
        valueAwait2.value = valueAwait2.value - 1;
      } else {
        timer.cancel(); // Stop the second timer when valueAwait2 reaches 0
        isShowBadge.value = false;
        startCountdownTimer(); // Start the first countdown again
      }
    });
  }

  void overTheProcess() {
    // Cancel the first timer and reset valueAwait to 0
    isShowBadge.value = false;
    _countdownTimer?.cancel();
    valueAwait.value = 10;

    // Cancel the second timer and reset valueAwait2 to 0
    _countdownTimer2?.cancel();
    valueAwait2.value = 45;

    // Start the process again by running startCountdownTimer2
    startCountdownTimer2();
  }

  void pauseTimers() {
    _countdownTimer?.cancel(); // Pause the first timer
    _countdownTimer2?.cancel(); // Pause the second timer
  }

  void resumeTimers() {
    // Resume the first timer if valueAwait is greater than 0
    if (_countdownTimer == null || _countdownTimer!.isActive) {
      if (valueAwait.value > 0) {
        _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
          if (valueAwait.value > 0) {
            valueAwait.value = valueAwait.value - 1;
          } else {
            timer.cancel(); // Stop the timer when valueAwait reaches 0
            valueAwait.value = 10; // Restart the countdown by resetting valueAwait to 10
            startCountdownTimer2(); // Start the second countdown again
          }
        });
      }
    }

    // Resume the second timer if valueAwait2 is greater than 0
    if (_countdownTimer2 == null || _countdownTimer2!.isActive) {
      if (valueAwait2.value > 0) {
        const oneSecond = Duration(seconds: 1);
        _countdownTimer2 = Timer.periodic(oneSecond, (timer) {
          if (valueAwait2.value > 0) {
            valueAwait2.value = valueAwait2.value - 1;
          } else {
            timer.cancel(); // Stop the second timer when valueAwait2 reaches 0
            valueAwait2.value = 45; // Restart the second countdown by resetting valueAwait2 to 45
            startCountdownTimer(); // Start the first countdown again
          }
        });
      }
    }
  }

  saveValueRate(int value) {
    valueRate = value.obs;
    update();
  }

  resetValueRate() {
    valueRate = 0.obs;
    update();
  }

  saveUserModel(User model) {
    user = model.obs as Rxn<Type>;
    update();
  }

  savePicker(String value) {
    pickCalendarValue1.value = value;
    // update();
  }

  savePicker2(String value) {
    pickCalendarValue2.value = value;
  }

  saveFrameRangePoint(int value) {
    frameRangePoint.value = value;
  }

  saveShakeWidget(bool value) {
    isShakeWidget.value = value;
  }
}
