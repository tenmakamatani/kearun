import 'package:flutter/material.dart';
import 'package:health/health.dart';

void main() => runApp(MaterialApp(
  title: 'test',
  home: Scaffold(
    appBar: AppBar(
      title: Text('Test')
    ),
    body: HealthWidget()
  )
));

class HealthWidget extends StatelessWidget {

  fetchData() async {
    dynamic datas = await Health.getHealthDataFromType(DateTime.utc(2000, 1, 1), DateTime.now(), HealthDataType.STEPS);
    datas.forEach((data) {
      print(data.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text('Push!'),
        onPressed: fetchData,
      ),
    );
  }
}