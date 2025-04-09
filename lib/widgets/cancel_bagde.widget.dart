import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiosk_new/getx/mycontroller.dart';
import 'package:kiosk_new/utils/mycolors.dart';
import 'package:kiosk_new/utils/mystrings.dart';
import 'package:kiosk_new/widgets/texts.dart';

// Widget cancelBadge({
//   width,
//   context,
//   MyGetXController? getX,
// }) {
//   return Obx(() => Visibility(
//         // visible: true,
//         visible: getX!.isShowBadge.value == true ? false : true,
//         child: Positioned(
//           top: StringFactory.padding016,
//           right: StringFactory.padding016,
//           child: Container(
//             width: width / 3,
//             padding: EdgeInsets.symmetric(horizontal: StringFactory.padding),
//             decoration: BoxDecoration(
//                 color: MyColor.white,
//                 border: Border.all(color: MyColor.red_bg_opacity),
//                 borderRadius: BorderRadius.circular(StringFactory.padding016)),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // textCustomNormalColor(
//                 //     color: MyColor.black_text,
//                 //     size: 14,
//                 //     text:
//                 //         'Auto back to home page ${getX!.valueAwait2} in ${getX.valueAwait.value} seconds'),
//                 Obx(
//                   () => textCustomNormalColor(
//                       color: MyColor.black_text,
//                       size: 14,
//                       text:
//                           'Auto back to home page ${getX!.valueAwait2} in ${getX.valueAwait.value} seconds'),
//                 ),
//                 IconButton(
//                     onPressed: () {
//                       // Navigator.of(context).pushNamed('/welcome');
//                       getX!.overTheProcess();
//                     },
//                     icon: Icon(Icons.close, color: MyColor.pinkMain))
//               ],
//             ),
//           ),
//         ),
//       ));
// }

Widget cancelBadge({width, context, MyGetXController? getX}) {
  return Obx(() => Visibility(
        // visible: true,
        visible: getX!.isShowBadge.value == true ? false : true,
        child: Positioned(
          top: StringFactory.padding016,
          right: StringFactory.padding016,
          child: Container(
            width: width / 3,
            padding: const EdgeInsets.symmetric(horizontal: StringFactory.padding),
            decoration: BoxDecoration(
                color: MyColor.white,
                border: Border.all(color: MyColor.red_bg_opacity),
                borderRadius: BorderRadius.circular(StringFactory.padding016)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                textCustomNormalColor(
                    color: MyColor.black_text,
                    size: 18.0,
                    text:'Auto back to home page  in ${getX.valueAwait.value} seconds'.toUpperCase()),
                IconButton(
                    onPressed: () {
                      // Navigator.of(context).pushNamed('/welcome');
                      getX.overTheProcess();
                    },
                    icon: const Icon(Icons.close, color: MyColor.pinkMain))
              ],
            ),
          ),
        ),
      ));
}
