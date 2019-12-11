import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  static const _alignments = [
    Alignment.centerRight,
    Alignment.centerLeft
  ];

  var _index = 0;
  AlignmentGeometry get _alignment => _alignments[_index % _alignments.length];

  @override
  Widget build(BuildContext context) {
    setState(() {
      _index++;
    });
    return AnimatedAlign(
      child: Text(
        '#運動したい',
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
          fontWeight: FontWeight.bold
        )
      ),
      alignment: _alignment,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOut
    );
  }
}
