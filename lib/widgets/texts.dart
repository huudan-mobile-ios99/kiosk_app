import 'package:flutter/material.dart';
import 'package:kiosk_new/utils/mycolors.dart';
import 'package:kiosk_new/utils/mystrings.dart';

Widget buildRow2WithShakeText({text, value, width, shakeKey}) {
  return Container(
    width: width,
    padding: const EdgeInsets.all(7.5),
    decoration: BoxDecoration(
      boxShadow: const [
        BoxShadow(
          color: MyColor.grey_tab,
          spreadRadius: 1.5,
          blurRadius: 2.5,
          offset: Offset(0, 2.5), // changes position of shadow
        ),
      ],
      border: Border.all(
        color: MyColor.grey,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(5),
      color: MyColor.white,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        textCustomGrey(text: '$text', size: 22),
        // ShakeWidget(
        //   key: shakeKey,
        //   shakeCount: 3,
        //   shakeOffset: 10,
        //   shakeDuration: const Duration(milliseconds: 500),
        //   child: textCustom(text: '$value', size: 22),
        // ),
      ],
    ),
  );
}

Widget textinput(
    {bool hasIcon = false,
    bool isNumber = false,
    onPressAdd,
    onTap,
    icon,
    TextEditingController? controller,
    required String? hintValue,
    required double? W,
    bool? isSecure = false,
    isCommenet = false,
    enable = true}) {
  return SizedBox(
    width: W,
    child: TextFormField(
      enabled: enable,
      obscureText: isSecure!,
      cursorWidth: 2.5,
      textAlign: TextAlign.left,
      cursorColor: MyColor.black_text,
      showCursor: true,
      autofocus: false,
      maxLines: isCommenet == true ? 5 : 1,
      onTap: () => onTap(),
      keyboardType:
          isNumber == false ? TextInputType.text : TextInputType.number,
      onChanged: (String value) {},
      decoration: InputDecoration(
          suffixIcon: hasIcon == true
              ? IconButton(
                  onPressed: () {
                    onPressAdd();
                  },
                  icon: Icon(icon, color: MyColor.yellow_accent))
              : null,
          contentPadding: const EdgeInsets.all(StringFactory.padding16),
          counterText: "",
          labelStyle: const TextStyle(color: MyColor.grey),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: MyColor.yellow2, width: 2.0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: MyColor.yellow_accent, width: 2.0),
          ),
          hintText: hintValue),
      controller: controller,
    ),
  );
}

Widget buildRow2({text, value, width, bool? hasIcon = false, onPressed}) {
  return Container(
    width: width,
    padding: const EdgeInsets.all(7.5),
    decoration: BoxDecoration(
      border: Border.all(
        color: MyColor.grey,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(5),
      color: MyColor.white,
      boxShadow: const [
        BoxShadow(
          color: MyColor.grey_tab,
          spreadRadius: 1.5,
          blurRadius: 2.5,
          offset: Offset(0, 2.5), // changes position of shadow
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        textCustomGrey(text: '$text', size: 22),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            textCustom(text: '$value', size: 22),
            const SizedBox(
              width: 15,
            ),
            hasIcon == true
                ? GestureDetector(
                    onTap: onPressed,
                    child: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: MyColor.black_text,
                    ))
                : Container(),
          ],
        ),
      ],
    ),
  );
}

Widget buildRow2Container({children, width}) {
  return Container(
      width: width,
      padding: const EdgeInsets.all(7.5),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: MyColor.grey_tab,
            spreadRadius: 1.5,
            blurRadius: 2.5,
            offset: Offset(0, 2.5), // changes position of shadow
          ),
        ],
        border: Border.all(
          color: MyColor.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
        color: MyColor.white,
        // color: Color(0xFFE0E0E0).withOpacity(.5)
      ),
      child: children);
}

Widget buildRowIcon({text, value, width}) {
  return Container(
    width: width,
    padding: const EdgeInsets.all(7.5),
    decoration: BoxDecoration(
      boxShadow: const [
        // BoxShadow(
        //   color: MyColor.grey_tab,
        //   spreadRadius: 1.5,
        //   blurRadius: 2.5,
        //   offset: const Offset(0, 2.5), // changes position of shadow
        // ),
      ],
      border: Border.all(
        color: MyColor.black_text,
        width: 1,
      ),
      // borderRadius: BorderRadius.circular(10),
      color: MyColor.yellow3,
      // color: Color(0xFFE0E0E0).withOpacity(.5)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        textCustomGrey(text: '$text', size: 22),
        textCustom(text: '$value', size: 22),
      ],
    ),
  );
}

Widget buildRowTextNormal({text, value, width}) {
  return Container(
    width: width,
    padding: const EdgeInsets.all(7.5),
    decoration: BoxDecoration(
      border: Border.all(
        color: MyColor.yellow3,
        width: 1,
      ),
      // borderRadius: BorderRadius.circular(10),
      color: MyColor.grey_tab.withOpacity(.25),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        textCustomNormal(text: '$text', size: 18),
        textCustomNormal(text: '$value', size: 18),
      ],
    ),
  );
}

Widget buildRow({text1, text2, value1, value2, width}) {
  return Container(
    width: width,
    padding: const EdgeInsets.all(7.5),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: MyColor.yellow.withOpacity(.15),
          spreadRadius: 1,
          blurRadius: 7,
          offset: const Offset(0, 1), // changes position of shadow
        ),
      ],
      border: Border.all(
        color: MyColor.grey_tab,
        width: 1.5,
      ),
      // borderRadius: BorderRadius.circular(5),
      color: MyColor.white,
      // color: Color(0xFFE0E0E0).withOpacity(.5)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textCustomGrey(text: '$text1', size: 22),
            textCustom(text: '$value1', size: 22),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textCustomGrey(text: '$text2', size: 22),
            textCustom(text: '$value2', size: 22),
          ],
        ),
      ],
    ),
  );
}

Widget containerYellow({width, widget, onPressed}) {
  return Container(
      width: width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.yellow, width: 3)),
      child: Row(
        children: [
          Container(child: widget),
          Expanded(
              child: IconButton(
                  onPressed: onPressed, icon: const Icon(Icons.calendar_month)))
        ],
      ));
}

Widget itemDate(width, onPress, String text, controller) {
  return SizedBox(
      width: width / 2,
      child: TextField(
        maxLength: 10,
        keyboardType: TextInputType.text,
        onChanged: (String value) {},
        decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: onPress,
              // onPressed: () {
              // if (controllerStartDate.text.length == 10) {
              //   setState(() {
              //     startDateText = controllerStartDate.text;
              //   });
              // }
              // },
              icon: const Icon(Icons.calendar_month),
            ),
            border: const OutlineInputBorder(),
            counter: const SizedBox.shrink(),
            hintText: 'Select start date',
            hintStyle: const TextStyle(
              fontSize: 14,
            )),
        controller: controller,
      )
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     Text(
      //       text,
      //       style: const TextStyle(color: Colors.grey),
      //     ),
      //     IconButton(
      //         onPressed: onPress,
      //         icon: const Icon(Icons.calendar_month, color: Colors.blue))
      //   ],
      // ),
      );
}

Widget columnData(
    {name,
    number,
    currentPoint,
    totalPoint,
    dailyPoint,
    monthlyPoint,
    weeklyPoint}) {
  return Column(
    children: [
      rowItem('Name', name),
      rowItem('Number', number ?? ''),
      rowItem('Total point', totalPoint),
      rowItem('Current point', currentPoint),
      rowItem('Daily point', dailyPoint),
      rowItem('Weekly point', weeklyPoint),
      rowItem('Monthly point', monthlyPoint),
    ],
  );
}

Widget rowItem(String name, number) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.all(7.5),
    decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey.shade300)),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name.toUpperCase(),
            style: const TextStyle(fontSize: 16, color: Colors.black87)),
        Text(number.toString(),
            style: const TextStyle(fontSize: 16, color: Colors.black87)),
      ],
    ),
  );
}

Widget textCustom({
  String? text,
  double? size,
  bool? isBold = false,
}) {
  return Text((text!),
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          // fontFamily: StringFactory.mainFont,
          fontSize: size,
          fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal));
}
Widget textCustomColor({
  String? text,
  double? size,color,
  bool? isBold = false,
}) {
  return Text((text!),
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal));
}

Widget textCustomNormal({
  text,
  double? size,
}) {
  return Text(text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: size, fontWeight: FontWeight.normal));
}

Widget textCustomNormalColor({
  text,
  double? size,
  color,
  bool? isBold = false,
}) {
  return Text(text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: isBold == false ? FontWeight.normal : FontWeight.bold));
}

Widget textCustomNormalColorFont(
    {text, double? size, color, font, textalign = TextAlign.center}) {
  return Text(text,
      overflow: TextOverflow.ellipsis,
      textAlign: textalign,

      style: TextStyle(
          // fontFamily: StringFactory.mainFont,
          color: color,
          fontSize: size,
          fontWeight: FontWeight.normal));
}

myTextSpan({font, color, size}) {
  TextSpan(
      text: 'hello',
      style: TextStyle(
          fontFamily: font,
          color: color,
          fontSize: size,
          fontWeight: FontWeight.normal));
}

Widget textCustomGrey({
  text,
  double? size,
}) {
  return Text(text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: size,
          fontFamily: 'Cinzel',
          color: Colors.black38,
          fontWeight: FontWeight.bold));
}

Widget textCustomGolden({
  text,
  double? size,
}) {
  return Text(text.toUpperCase(),
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: size,
          fontFamily: 'Quantum_Lemon',
          fontWeight: FontWeight.bold,
          color: const Color(0xffFAD02C)));
}

Widget textCustomGolden2({
  text,
  double? size,
}) {
  return Text(text.toUpperCase(),
      style: TextStyle(
          fontSize: size,
          fontFamily: 'BebasNeue',
          fontWeight: FontWeight.bold,
          color: const Color(0xffFAD02C)));
}
