import 'package:flutter/material.dart';

class StepsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/kearun.png'),
            fit: BoxFit.cover
          )
        )
      )
    );
  }
}