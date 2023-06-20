import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final VoidCallback? onTap;
  final Alignment alignment;
  const CustomText(
      {this.text = '',
      this.fontSize = 16,
      this.color = Colors.black,
      this.alignment = Alignment.topLeft,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: alignment,
        child: Text(
          text,
          style: TextStyle(
              color: color, fontSize: fontSize, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
