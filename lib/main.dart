import 'package:flutter/material.dart';

import 'package:kearun/services/background.dart';

import 'package:kearun/screens/steps_list_screen.dart';

void main() {
  setUpBackgroundTask();
  runApp(App());
}

class App extends StatelessWidget {
  Widget build(BuildContext context) => MaterialApp(
    title: 'Kearun',
    home: StepsListScreen(),
    theme: ThemeData(
      accentColor: Colors.cyan[700]
    ),
  );
}
