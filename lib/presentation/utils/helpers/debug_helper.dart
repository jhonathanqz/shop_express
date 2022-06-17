import 'package:flutter/cupertino.dart';

class DebugHelper {
  static void debug(String session, String message, {String? function}) {
    function != null ? print('''

    =============== $session - INICIO ================
    ****Function: $function ****
    $message
    =============== $session - FIM ================

    ''') : print('''

    =============== $session - INICIO ================
    $message
    =============== $session - FIM ================

    ''');
  }
}
