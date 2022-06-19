import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:shop_express/app/app.dart';
import 'package:shop_express/app/injection_container.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupDependencies();
  runApp(
    const App(),
  );
}
