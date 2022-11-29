import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/icon1.svg', fit: BoxFit.contain),
            const Text(
              "User with this nickname not found!",
              style: TextStyle(fontSize: 30, color: Colors.red),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
