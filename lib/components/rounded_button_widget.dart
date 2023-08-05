// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../util/colors.dart';



class RoundedButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final double borderRadius;
  // final double paddingVertical;
  // final double paddingHorizontal;
  // final double margin;
  final double width;
  final double height;
  final FontWeight fontWeight;
  final Function press;
  final bool loading;
  final Color color, textColor;
  const RoundedButton({
    super.key,
    this.width = 150,
    this.height = 20,
    this.borderRadius = 30,
    // this.paddingVertical = 20,
    // this.paddingHorizontal = 40,
    this.fontSize = 14,
    // this.margin = 10,
    this.fontWeight = FontWeight.normal,
    this.loading = false,
    required this.text,
    required this.press,
    this.color = kButtonColor,
    this.textColor = Colors.white,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: Size(width, height),
          backgroundColor: color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
          textStyle: TextStyle(
              fontFamily: 'rpt_Regular',
              color: textColor,
              fontSize: fontSize,
              fontWeight: FontWeight.w500)),
      onPressed: () => press(context),
      child: (loading)
          ? const CircularProgressIndicator(
              backgroundColor: Colors.white,
              color: kPrimaryColor,
            )
          : Text(
              text,
              style: TextStyle(
                  fontFamily: 'rpt_Regular',
                  color: textColor,
                  fontWeight: fontWeight),
            ),
    ));
  }
}
