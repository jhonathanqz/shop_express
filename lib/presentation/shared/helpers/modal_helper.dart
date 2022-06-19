import 'package:flutter/material.dart';

class ModalHelper {
  static void open({
    required BuildContext context,
    required Widget content,
    Color backgroundColor = Colors.white,
    bool isDismissible = false,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: backgroundColor,
      isDismissible: isDismissible,
      builder: (context) => content,
    );
  }
}
