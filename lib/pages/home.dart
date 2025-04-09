import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kiosk_new/functions/calculator.functions.dart';
import 'package:kiosk_new/functions/input.deboucer.dart';
import 'package:kiosk_new/getx/mycontroller.dart';
import 'package:kiosk_new/models/status.dart';
import 'package:kiosk_new/models/status.range.dart';
import 'package:kiosk_new/pages/welcome.dart';
import 'package:kiosk_new/services/myservices.api.dart';
import 'package:kiosk_new/utils/mycolors.dart';
import 'package:kiosk_new/utils/mystringformats.dart';
import 'package:kiosk_new/utils/mystrings.dart';
import 'package:kiosk_new/widgets/body.widget.dart';
import 'package:kiosk_new/widgets/body_calendar.widget.dart';
import 'package:kiosk_new/widgets/calendar.input.dart';
import 'package:kiosk_new/widgets/cancel_bagde.widget.dart';
import 'package:kiosk_new/widgets/exitpopup.dart';
import 'package:kiosk_new/widgets/header.widget.dart';
import 'package:kiosk_new/widgets/shake.widget.dart';
import 'package:kiosk_new/widgets/texts.dart';

import '../widgets/toasts.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  //loading await data from welcome screen
  bool isLoading = true;

  String? name, tiername, title, email, phone, id;

  int? currentPoint,
      totalPoint,
      number,
      dailyPoint,
      monthlyPoint,
      weeklyPoint,
      dailyPointSlot,
      dailyPointRLTB;

  HomePage(
      {super.key,
      this.name,
      this.tiername,
      this.title,
      this.email,
      this.phone,
      this.id,
      this.currentPoint,
      this.totalPoint,
      this.number,
      this.dailyPoint,
      this.monthlyPoint,
      this.weeklyPoint,
      this.dailyPointSlot,
      this.dailyPointRLTB});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? startDate, endDate, startendDateString = '...';
  int? framePoint = 0;
  int? currentPoint = 0;
  final shakeKey = GlobalKey<ShakeWidgetState>();
  final getX = Get.put(MyGetXController());
  // final MyGetXController getX = Get.find();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    // Set isLoading to true to show the loading state initially
    widget.isLoading = true;

    getX.startCountdownTimer2();
    if (widget.number != null) {
      service.findDateFrameByNumber(widget.number).then((value) {
        // print(value);
        if (value.list.isNotEmpty) {
          if (value.list.first.frameEndDate != DateTime(2000, 01, 01) ||
              value.list.first.frameStartDate != DateTime(2000, 01, 01)) {
            setState(() {
              startDate =
                  formatString.formatDate(value.list.first.frameStartDate);
              endDate = formatString.formatDate(value.list.first.frameEndDate);
              startendDateString = '$startDate | $endDate';
            });
          }
          //point frame
          service
              .postPointCardTrackRange(
                  id: widget.id, startDate: (startDate), endDate: (endDate))
              .then((value) {
            StatusRange model = value;
            // print('point:${model.data.loyaltyPointsFrame}');
            setState(() {
              framePoint = model.data.loyaltyPointsFrame;
            });
          });
        } else {
          // print('no run APIs');
          startendDateString = '...';
        }
      }).whenComplete(() => setState(() {
            widget.isLoading = false;
      }));
    }
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    debounce.dispose();
    getX.resetTimer();
    super.dispose();
  }

  final Debounce debounce = Debounce(const Duration(milliseconds: 500));
  final controller = TextEditingController();
  final controllerStartDate = TextEditingController();
  final controllerEndDate = TextEditingController();
  final service = ServiceAPIs();
  final format = StringFormat();
  final today = DateTime.now();
  final formatterNum = NumberFormat();

  Status model = Status(
      status: false,
      data: Data(
          email: '',
          phone: '',
          tiername: '',
          title: '',
          preferredName: '',
          number: 0,
          loyaltyPoints: 0,
          loyaltyPointsToday: 0,
          loyaltyPointTodaySlot: 0,
          loyaltyPointTodayRLTB: 0,
          loyaltyPointsCurrent: 0,
          loyaltyPointsWeek: 0,
          loyaltyPointsMonth: 0));

  final PageController _pageController = PageController(
    initialPage: 0,
  );

  int currentPageIndex = 0;
  void _goToPage(int pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 560),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
// Show loading UI while isLoading is true
    if (widget.isLoading == true) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return WillPopScope(
      onWillPop: () async {
        bool? exitConfirmed = await showExitPopup(
            context: context,
            onPressCancel: () {
              getX.overTheProcess();
            },
            onPressYes: () {
              print('onPress yes dialog');
              getX.resetTimer();
              getX.resetPickFramePoint();
              // Navigator.of(context).push(MaterialPageRoute(builder: (_) => const WelcomePage()));
              Get.offAll(const WelcomePage(), transition: Transition.fade);
            });
        return exitConfirmed ?? false;
      },
      child: Scaffold(
          body: SafeArea(
              child: Stack(children: [
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: StringFactory.padding048,
              vertical: StringFactory.padding016),
          alignment: Alignment.center,
          width: width,
          height: height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  filterQuality: FilterQuality.none,
                  image: AssetImage(StringFactory.bg2),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                header(
                    width: width,
                    name: '${widget.name}',
                    number: '${widget.number}',
                    title: "${widget.title}"),
                const SizedBox(
                  height: StringFactory.padding016,
                ),

                //body of home using pageview
                SizedBox(
                  width: width,
                  height: height * 0.75,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        currentPageIndex = index;
                      });
                    },
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      body(
                          context: context,
                          width: width,
                          height: height,
                          imagePath: calculateImageLevel(widget.tiername!),
                          onPressPrint: () {
                            // print('object onpress print home ');
                            printDialogShow();
                            getX.overTheProcess();
                          },
                          onPressBack: () {
                            print('onpressback1');
                            // Get.offAll(const WelcomePage());
                            // getX.resetPickFramePoint();
                            // getX.resetTimer();
                            getX.resetTimer();
                            getX.resetPickFramePoint();
                            // Navigator.of(context).push(MaterialPageRoute(builder: (_) => const WelcomePage()));
                            Get.offAll(const WelcomePage(),
                                transition: Transition.fade);
                          },
                          onPressCustomCheck: () {
                            // print('object onpress onPressCustomCheck home ');
                            _goToPage(1);
                            getX.overTheProcess();
                          },
                          pointFrame: framePoint == 0 || framePoint! <= 0
                              ? '...'
                              : formatterNum.format(framePoint),
                          pointCurrent:
                              formatterNum.format(widget.currentPoint),
                          pointNextLevel: framePoint == 0
                              ? '...'
                              : caculatePointNext(framePoint!) == 1000001
                                  ? 'REACH MAX'
                                  : formatterNum.format(caculatePointNext(framePoint!)),
                          tierFrame: startendDateString == '...'
                              ? '...'
                              : '$startendDateString',
                          pointMonthly:
                              formatterNum.format(widget.monthlyPoint),
                          pointWeekly: formatterNum.format(widget.weeklyPoint),
                          dailyPoint: formatterNum.format(widget.dailyPoint),
                          pointDailyRLTB:
                              formatterNum.format(widget.dailyPointRLTB),
                          pointDailySlot:formatterNum.format(widget.dailyPointSlot)),
                      bodycalendar(
                          width: width,
                          height: height,
                          id: widget.id,
                          shakeKey: shakeKey,
                          onPressNotPicked: () {
                            // print('no shake');
                          },
                          onPressShake: () {
                            // print('press shake');
                            shakeKey.currentState!.shake();
                          },
                          onPressPrint: () {
                            // print('object onpress print caledanr ');
                            printDialogShow();
                            getX.overTheProcess();
                          },
                          onPressBackBtn: () {
                            _goToPage(0);
                            print('back button 2 click');
                            getX.overTheProcess();
                          },
                          onPressCustomCheck: () {
                            // print('object onpress onPressCustomCheck calendar ');
                            _goToPage(0);
                            getX.overTheProcess();
                          },
                          imagePath: calculateImageLevel(widget.tiername!),
                          context: context),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),

        //CANCEL BADGE
        cancelBadge(width: width, context: context, getX: getX)
      ]))),
    );
  }

  printDialogShow(
    // MyGetXController? getX
  ) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            titlePadding: const EdgeInsets.all(16),
            actionsAlignment: MainAxisAlignment.spaceBetween,
            title: textCustomNormal(
                size: 22, text: 'Do you want to print receipt?'),
            actions: [
              TextButton(
                  onPressed: () async {
                    // cancelTimer();
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                      padding: WidgetStateProperty.all<EdgeInsets>(
                          const EdgeInsets.all(5)),
                      backgroundColor:
                          WidgetStateProperty.all(MyColor.grey_tab)),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: MyColor.black_text, fontSize: 25),
                  )),
              const SizedBox(width: 25),
              TextButton(
                  onPressed: () async {
                    // cancelTimer();
                    const url = "http://127.0.0.1:8080/api/print/vegaspoint";
                    // print(widget.currentPoint);
                    // print(widget.dailyPoint);
                    // print(widget.dailyPointSlot);
                    // print(widget.dailyPointRLTB);
                    // print(widget.weeklyPoint);
                    // print(widget.monthlyPoint);
                    // print(framePoint);
                    // print(getX.frameRangePoint.value);
                    // print(currentPoint);
                    await service.postPrint(
                            cusName: '${widget.name}',
                            cusNumber: '${widget.number}',
                            cPoint: '${widget.currentPoint}',
                            dPoint: '${widget.dailyPoint}',
                            fPoint: framePoint == 0 ? '...' : '$framePoint',
                            mPoint: '${widget.monthlyPoint}',
                            url: url,
                            wPoint: '${widget.weeklyPoint}',
                            slPoint: '${widget.dailyPointSlot}',
                            rlPoint: '${widget.dailyPointRLTB}',
                            xPoint: '${getX.frameRangePoint.value}')
                        .then((value) {
                      if (value == null) {
                        Navigator.of(context).pop();
                        showToast('CAN NOT PRINT POINTS');
                      } else {
                        Navigator.of(context).pop();
                        showToastLong('POINTS PRINTED');
                      }
                    }).whenComplete(() {
                      Navigator.of(context).pop();
                    });
                  },
                  style: ButtonStyle(
                      padding: WidgetStateProperty.all<EdgeInsets>(
                          const EdgeInsets.all(10)),
                      backgroundColor:
                          WidgetStateProperty.all(MyColor.pinkMain)),
                  child: const Text(
                    'Yes',
                    style: TextStyle(color: MyColor.white, fontSize: 25),
                  ))
            ],
          );
        });
  }
}
