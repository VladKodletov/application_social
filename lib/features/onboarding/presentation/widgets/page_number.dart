import 'package:flutter/material.dart';

class PageNumber extends StatelessWidget {
  final Color colorText;
  final Color backgroundColor;
  final int number;

  const PageNumber({
    Key? key,
    required this.colorText,
    required this.backgroundColor,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 14,
          backgroundColor: backgroundColor,
          child: Text(
            '$number',
            style: TextStyle(color: colorText, fontSize: 12),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
      ],
    );
  }
}
