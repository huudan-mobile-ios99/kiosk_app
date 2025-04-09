import 'package:flutter/material.dart';

Widget rowWidget({widget1,widget2}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      widget1,
      widget2,
    ],
  );
}

Widget rowWidgetCenter({widget1,widget2}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      widget1,
      widget2,
    ],
  );
}
