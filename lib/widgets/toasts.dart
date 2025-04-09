import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kiosk_new/utils/mycolors.dart';

showToast(message) {
    return Fluttertoast.showToast(
        msg: message,
								webShowClose: true,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.red,
        webBgColor: "linear-gradient(to right, #FFFFFF, #FFFFFF)",
        fontSize:12.0);
}
showToastLong(message) {
    return Fluttertoast.showToast(
        msg: message,
				webShowClose: true,
    	  // webBgColor: "linear-gradient(to right, #FFD600, #FF6D00)",
        webBgColor: "linear-gradient(to right, #FFFFFF, #FFFFFF)",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        textColor: Colors.orangeAccent,
        fontSize: 12.0);
}



showToastError(message) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red.withOpacity(0.75),
        textColor: Colors.white,
        fontSize: 12.0);
}
