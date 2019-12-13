import 'package:flutter/material.dart';

import 'package:kearun/repositories/get_steps.dart';

class Callout extends StatefulWidget {

  final bool visible;
  Callout({
    Key key,
    this.visible
  }) : super(key: key);

  @override
  _CalloutState createState() => _CalloutState();
}

class _CalloutState extends State<Callout> {
  
  Future<double> _getSteps() async {
    final stepsData = await GetSteps.getSteps();

    double steps = 0;
    stepsData.forEach((data) {
      steps += data.value;
    });
    return steps;
  }

  @override
  Widget build(BuildContext context) => FutureBuilder(
    future: this._getSteps(),
    builder: (BuildContext context, AsyncSnapshot steps) {
      if (widget.visible) {
        if (steps.hasError) {
        return CalloutWidget(text: 'エラーが発生したケア！');
        }
        if (steps.hasData) {
          if (steps.data < 5000) {
            return CalloutWidget(text: '今日は、${steps.data.round()}歩しか歩いてないケア…');
          } else {
            return CalloutWidget(text: '今日は、${steps.data.round()}歩も歩いたケア！');
          }
        }
        return Container();
      } else {
        return Container();
      }
    },
  );
}

class CalloutWidget extends StatelessWidget {

  final String text;
  CalloutWidget({
    this.text
  })
    : assert(text != null);

  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Center(
            child: Text(
            this.text,
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).accentColor
            ),
          ),
        ),
        width: MediaQuery.of(context).size.width * 0.9,
        height: 50,
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.45),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30)
        ),
      ),
    );
  }

}
