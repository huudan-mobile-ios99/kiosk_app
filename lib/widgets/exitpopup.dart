import 'package:flutter/material.dart';
import 'package:kiosk_new/utils/mycolors.dart';
import 'package:kiosk_new/widgets/texts.dart';

Future<bool?> showExitPopup(
    {BuildContext? context, onPressYes, onPressCancel}) async {
  return showDialog<bool?>(
      context: context!,
      builder: (_) {
        return AlertDialog(
          titlePadding: const EdgeInsets.all(16),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          title: textCustomNormal(size: 22, text: 'Exit App?'),
          actions: [
            TextButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  onPressCancel();
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
                  onPressYes();
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
