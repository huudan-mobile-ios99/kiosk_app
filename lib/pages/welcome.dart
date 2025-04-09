import 'package:flutter/material.dart';
import 'package:kiosk_new/functions/input.deboucer.dart';
import 'package:kiosk_new/models/status.dart';
import 'package:kiosk_new/models/status_short.dart';
import 'package:kiosk_new/pages/home.dart';
import 'package:kiosk_new/services/myservices.api.dart';
import 'package:kiosk_new/utils/mycolors.dart';
import 'package:kiosk_new/utils/mystringformats.dart';
import 'package:kiosk_new/utils/mystrings.dart';
import 'package:kiosk_new/widgets/myroute.dart';
import 'package:kiosk_new/widgets/snackbar.dart';
import 'package:kiosk_new/widgets/toasts.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final firstDateCalendar = DateTime(2010, 01, 01);
  final lastDateCalendar = DateTime(2030, 01, 01);
  DateTime startDatePicker = DateTime.now();
  DateTime endDatePicker = DateTime.now();
  var focusNode = FocusNode();
  bool hasLoading = false;

  //important to set image card
  String? tierNameMy;
  StatusShort? modelShort;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    debounce.dispose();
    super.dispose();
    hasLoading = false;
  }

  final Debounce debounce = Debounce(const Duration(milliseconds: 500));
  final controller = TextEditingController();
 

  final controllerStartDate = TextEditingController();
  final controllerEndDate = TextEditingController();
  String? startDateText, endDateText;
  final service = ServiceAPIs();
  String? number;
  String? idPass;
  final format = StringFormat();
  final today = DateTime.now();
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
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    // const paddingValue = 16.0;
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            print('auto focus');
            focusNode.requestFocus();
          },
          child: Container(
            alignment: Alignment.center,
            width: width,
            height: height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    filterQuality: FilterQuality.low,
                    image: AssetImage(StringFactory.bg1),
                    fit: BoxFit.fill)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Container(
                //     width: width - StringFactory.padding016 * 4,
                //     alignment: Alignment.center,
                //     padding:
                //         const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                //     decoration: BoxDecoration(
                //       color: MyColor.grey_tab.withOpacity(.25),
                //       borderRadius:
                //           BorderRadius.circular(StringFactory.padding04),
                //     ),
                //     child: textCustomNormal(
                //         text: 'SWIPE YOUR CARD TO VIEW POINTS', size: 12)),
                Opacity(
                  opacity: 0.025,
                  child: TextField(
                    focusNode: focusNode,
                    cursorWidth: 10,
                    cursorColor: Colors.black,
                    showCursor: false,
                    autofocus: true,
                    obscureText: true,
                    maxLength: 13,
                    keyboardType: TextInputType.text,
                    onChanged: (String value) {
                      debounce(() {
                        if (value.length == 9 ||
                            value.length == 10 ||
                            value.length >= 11) {
                          turOnProgressLoad();
                          service.postPointCardTrack(
                            isFullInfor: true,
                            id: validateIdString(controller.text),
                            today: format.formatDate(today),
                            today2: format.formatDate(getTomorrow(today)),
                            startWeek: getDateWeek(today)[0],
                            endWeek: getDateWeek(today)[1],
                            startMonth: getDateMonth(today)[0],
                            endMonth: getDateMonth(today)[1],
                          )
                              .then((value) {
                            setState(() {
                              idPass = controller.text;
                            });
                            model = value;
                            if (model.status == true && idPass!.isNotEmpty) {
                              //Save Share Preferences
                              // final helper = Helper();
                              // helper.removeUserModelPref();
                              // helper.saveUserModelPrefs(User(
                              //     id: (idPass!
                              //         .replaceAll('?', "")
                              //         .replaceAll(";", "")
                              //         .trim()),
                              //     name: model.data.preferredName,
                              //     number: model.data.number,
                              //     phone: model.data.phone,
                              //     email: model.data.email,
                              //     title: model.data.title,
                              //     tiername: model.data.tiername,
                              //     currentPoint: model.data.loyaltyPointsCurrent,
                              //     dailyPoint: model.data.loyaltyPointsToday,
                              //     dailyPointRl:model.data.loyaltyPointTodayRLTB,
                              //     dailyPointSl:model.data.loyaltyPointTodaySlot,
                              //     totalPoint: model.data.loyaltyPoints,
                              //     weeklyPoint: model.data.loyaltyPointsWeek,
                              //     monthlyPoint: model.data.loyaltyPointsMonth));
                              //End Func
                              service
                                  .postPointCardTrack(
                                isFullInfor: false,
                                id: validateIdString(controller.text),
                                today: format.formatDate(today),
                                today2: format.formatDate(getTomorrow(today)),
                                startWeek: getDateWeek(today)[0],
                                endWeek: getDateWeek(today)[1],
                                startMonth: getDateMonth(today)[0],
                                endMonth: getDateMonth(today)[1],
                              )
                                  .then((value) {
                                setState(() {
                                  modelShort = value;
                                });
                                Navigator.of(context).push(MyRoute(
                                    page: HomePage(
                                        id: validateIdString(idPass!),
                                        name: model.data.preferredName,
                                        number: model.data.number,
                                        phone: model.data.phone,
                                        email: model.data.email,
                                        title: model.data.title,
                                        tiername: modelShort!.data.tierName ??
                                            model.data.tiername,
                                        currentPoint:
                                            model.data.loyaltyPointsCurrent,
                                        dailyPoint:
                                            model.data.loyaltyPointsToday,
                                        dailyPointSlot:
                                            model.data.loyaltyPointTodayRLTB,
                                        dailyPointRLTB:
                                            model.data.loyaltyPointTodaySlot,
                                        totalPoint: model.data.loyaltyPoints,
                                        weeklyPoint:
                                            model.data.loyaltyPointsWeek,
                                        monthlyPoint:
                                            model.data.loyaltyPointsMonth)));
                              });
                              controller.clear();
                              turnOffProgressLoad();
                            } else {
                              // showToastLong('Can not find information with this card, please try again!');
                              customSnackBar(
                                  context: context,
                                  message:
                                      'CAN NOT FIND INFORMATION WITH THIS CARD, PLEASE TAP IN SCREEN & TRY AGAIN!');
                              turnOffProgressLoad();
                              controller.clear();
                              focusNode.requestFocus();
                            }
                          });
                        } else {
                          turnOffProgressLoad();
                          customSnackBar(
                              context: context,
                              message:
                                  'CAN NOT FIND INFORMATION WITH THIS CARD, PLEASE TAP IN SCREEN & TRY AGAIN!');
                        }
                      });
                    },
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16),
                        counterText: "",
                        labelStyle: const TextStyle(
                            color: Colors.transparent, fontSize: 56.0),
                        border: InputBorder.none,
                        hintText: 'Enter customer card number'.toUpperCase(),
                        hintStyle: const TextStyle(
                            fontSize: 18, color: Color.fromRGBO(0, 0, 0, 0))),
                    controller: controller,
                  ),
                ),
                hasLoading == true
                    ? Transform.scale(
                        scale: 3.5,
                        child: const CircularProgressIndicator.adaptive(
                          strokeWidth: 4,
                          backgroundColor: Colors.pinkAccent,
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }

  String validateIdString(String value) {
    return value
        .replaceAll('?', "")
        .replaceAll(";", "")
        .replaceAll("%", "")
        .trim();
  }

  getTomorrow(DateTime today) {
    final tmr = DateTime(today.year, today.month, today.day + 1);
    return tmr;
  }

  getDateMonth(DateTime today) {
    final firstDayOfMonth = DateTime(today.year, today.month, 1);
    final lastDayOfMonth = DateTime(today.year, today.month + 1, 0);
    return [
      format.formatDate(firstDayOfMonth),
      format.formatDate(lastDayOfMonth)
    ];
  }

  getDateWeek(DateTime today) {
    final weekDay = today.weekday;
    final firstDayOfWeek = today.subtract(Duration(days: weekDay - 1));
    final lastDayOfWeek = today.subtract(Duration(days: weekDay - 7));
    return [
      format.formatDate(firstDayOfWeek),
      format.formatDate(lastDayOfWeek)
    ];
  }

  turOnProgressLoad() {
    setState(() {
      hasLoading = true;
    });
  }

  turnOffProgressLoad() {
    setState(() {
      hasLoading = false;
    });
  }
}
