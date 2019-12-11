import 'package:flutter/material.dart';

import 'package:kearun/repositories/get_steps.dart';

class StepsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;
    final double _screenHeight = MediaQuery.of(context).size.height;

    Future<void> displaySteps() async {
      final stepsData = await GetSteps.getSteps();
      final steps = stepsData.map((each) {
        return each.value;
      });
      print(steps);
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/home.png'),
                fit: BoxFit.fitHeight
              )
            )
          ),
          Container(
            child: Image.asset(
              'images/kearun.png',
              fit: BoxFit.fitWidth
            ),
            width: _screenWidth * 0.7,
            height: _screenHeight * 0.7,
            margin: EdgeInsets.only(top: 200)
          ),
          Center(
            child: Container(
              child: ButtonTheme(
                minWidth: _screenWidth * 0.25,
                height: _screenWidth * 0.25,
                child: RaisedButton(
                  child: Icon(
                    Icons.assignment,
                    color: Colors.white,
                    size: _screenWidth * 0.2
                  ),
                  color: Theme.of(context).accentColor,
                  shape: CircleBorder(),
                  onPressed: displaySteps,
                ),
              ),
              margin: EdgeInsets.only(top: _screenHeight * 0.7),
            ),
          ),
          Center(
            child: Container(
              child: Row(
                children: <Widget>[
                  IconContainer(Icons.work, _screenWidth * 0.16),
                  IconContainer(Icons.camera_alt, _screenWidth * 0.16)
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              width: _screenWidth * 0.75,
              margin: EdgeInsets.only(top: _screenHeight * 0.8),
            ),
          )
        ],
      )
    );
  }
}

class IconContainer extends StatelessWidget {
  final IconData _icon;
  final double _size;

  IconContainer(
    this._icon,
    this._size
  )
    : assert(_icon != null),
      assert(_size != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        this._icon,
        color: Colors.white,
        size: this._size * 0.7
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).accentColor
      ),
      width: this._size,
      height: this._size
    );
  }
}