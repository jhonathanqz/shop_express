import 'package:flutter/material.dart';

loadingCircular() {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.only(top: 12.0),
    child: const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.lightGreenAccent),
    ),
  );
}
