import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogHelper {
  static void open({
    required BuildContext context,
    required Widget content,
    bool barrierDismissible = false,
  }) async {
    if (Platform.isAndroid) {
      return showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) => content,
      );
    } else {
      return showCupertinoDialog(
        context: context,
        builder: (context) => content,
      );
    }
  }

  //static void omniAlert({
  //  required BuildContext context,
  //  required String message,
  //  bool barrierDismissible = false,
  //  String? imagePath,
  //  String? buttonLabel,
  //  VoidCallback? closeAction,
  //  VoidCallback? leaveStoreAction,
  //  Function? action,
  //  bool showCloseButton = true,
  //}) async {
  //  if (Platform.isAndroid) {
  //    return showDialog(
  //      context: context,
  //      barrierDismissible: barrierDismissible,
  //      builder: (context) => OmniAlertDialog(
  //        message: message,
  //        imagePath: imagePath,
  //        buttonLabel: buttonLabel,
  //        closeAction: closeAction,
  //        leaveStoreAction: leaveStoreAction,
  //        action: action,
  //        showCloseButton: showCloseButton,
  //      ),
  //    );
  //  } else {
  //    return showCupertinoDialog(
  //      context: context,
  //      builder: (context) => OmniAlertDialog(
  //        message: message,
  //        imagePath: imagePath,
  //        buttonLabel: buttonLabel,
  //        closeAction: closeAction,
  //        leaveStoreAction: leaveStoreAction,
  //        action: action,
  //        showCloseButton: showCloseButton,
  //      ),
  //    );
  //  }
  //}
}
