import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _likes = 0;
  late final DatabaseReference _likesRef;
  late StreamSubscription<DatabaseEvent> _likesSubscription;

  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    _likesRef = FirebaseDatabase.instance.ref('likes');
    try {
      final likeSnashot = await _likesRef.get();
      _likes = likeSnashot.value as int;
    } catch (e) {
      print('**ERRO try firebase: $e');
    }

    _likesSubscription = _likesRef.onValue.listen(
      (DatabaseEvent event) {
        setState(() {
          _likes = (event.snapshot.value ?? 0) as int;
        });
      },
      onError: (e) {
        print('**ERRO firebase subscription: $e');
      },
    );
  }

  like() async {
    await _likesRef.set(ServerValue.increment(1));
  }

  @override
  void dispose() {
    _likesSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_likes',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: like,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
