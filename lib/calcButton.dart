import 'package:flutter/material.dart';

class calcButton extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;
  final double fontSize;
  final Function callback;
  const calcButton(
      {Key? key,
      required this.text,
      this.fillColor = 0,
      required this.textColor,
      required this.fontSize,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: SizedBox(
          width: 65,
          height: 65,
          child: FlatButton(
            child: Text(
              text,
              style: TextStyle(fontSize: fontSize),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            color: fillColor != 0 ? Color(fillColor) : null,
            onPressed: () {
              callback(text);
            },
            textColor: Color(textColor),
          ),
        ));
  }
}
