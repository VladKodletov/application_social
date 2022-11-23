// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:application_social/features/auth/presentation/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:application_social/features/onboarding/presentation/screens/widgets/page_number.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardWidget extends StatelessWidget {
  final String onboardingImage;
  final int isActive;
  final String text;
  double heightSizeBox;

  OnBoardWidget({
    Key? key,
    required this.onboardingImage,
    required this.isActive,
    required this.text,
    this.heightSizeBox = 6,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: const Color(0xfff7f7f8),
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(left: 24, top: 60),
            child: SvgPicture.asset(
              'assets/images/010.svg',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 30,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/$onboardingImage',
                    // fit: BoxFit.cover,
                    fit: BoxFit.contain),
                SizedBox(
                  height: heightSizeBox,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(text,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        textStyle: (const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700)),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    PageNumber(
                      colorText: isActive == 1 ? Colors.black : Colors.white,
                      number: 1,
                      backgroundColor: isActive == 1
                          ? Colors.white
                          : Color.fromRGBO(64, 64, 64, 1),
                    ),
                    PageNumber(
                        colorText: isActive == 2 ? Colors.black : Colors.white,
                        number: 2,
                        backgroundColor: isActive == 2
                            ? Colors.white
                            : Color.fromRGBO(64, 64, 64, 1)),
                    PageNumber(
                        colorText: isActive == 3 ? Colors.black : Colors.white,
                        number: 3,
                        backgroundColor: isActive == 3
                            ? Colors.white
                            : Color.fromRGBO(64, 64, 64, 1)),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: isActive == 3
                      ? () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Auth(),
                              ));
                        }
                      : () {},
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      textStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      minimumSize: const Size(double.infinity, 60)),
                  child: const Text(
                    'Next',
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
