import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

void copyIpAddress(String text) {
  Clipboard.setData(ClipboardData(text: text))
      .onError(
        (error, stackTrace) => Fluttertoast.showToast(
          msg: error.toString(),
        ),
      )
      .then(
        (value) => Fluttertoast.showToast(
          msg: 'IP Address Copied',
        ),
      );
}
