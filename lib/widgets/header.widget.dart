import 'package:flutter/material.dart';
import 'package:kiosk_new/utils/mycolors.dart';
import 'package:kiosk_new/utils/mystrings.dart';
import 'package:kiosk_new/widgets/texts.dart';

Widget header({
  width,
  String? name,
  number,
  title,
}) {
  return Container(
    width: width,
    padding: const EdgeInsets.symmetric(horizontal: StringFactory.padding32),
    alignment: Alignment.topCenter,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            itemRow(
              'Welcome, $title ${name!.toUpperCase()}',
              StringFactory.logo_user,
            ),
            const SizedBox(
              height: StringFactory.padding016,
            ),
            itemRow('$number', StringFactory.logo_number),
          ],
        ),
        const SizedBox(
          height: StringFactory.padding016,
        ),
        Container(
          height: 125,
          width: 150,
          decoration: const BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(StringFactory.logo_img))),
        )
      ],
    ),
  );
}

Widget itemRow(text, image) {
  return Container(
    padding: EdgeInsets.symmetric(vertical:StringFactory.padding,horizontal:StringFactory.padding16 ),
    decoration: BoxDecoration(
        color: MyColor.grey_tab_opa,
        // border: Border.all(color:MyColor.grey_tab),
        borderRadius: BorderRadius.circular(StringFactory.padding16)),
    child: Row(
      children: [
        Container(
          height: 37.5,
          width: 37.5,
          decoration:
              BoxDecoration(image: DecorationImage(image: AssetImage(image))),
        ),
        const SizedBox(
          width: StringFactory.padding016,
        ),
        textCustom(text: text, size: 22, isBold: true),
      ],
    ),
  );
}
