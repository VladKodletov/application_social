// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:application_social/features/onboarding/presentation/screens/widgets/page_number.dart';

class OnBoardWidget extends StatelessWidget {
  final String onboardingImage;
  final int isActive;

  const OnBoardWidget({
    Key? key,
    required this.onboardingImage,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8),
        color: const Color(0xfff7f7f8),
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(left: 24, top: 60),
            child: SvgPicture.asset(
              'assets/images/010.svg',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/$onboardingImage',
                  // fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text('data'),
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
                      backgroundColor:
                          isActive == 1 ? Colors.white : Colors.black,
                    ),
                    PageNumber(
                        colorText: isActive == 2 ? Colors.black : Colors.white,
                        number: 2,
                        backgroundColor:
                            isActive == 2 ? Colors.white : Colors.black),
                    PageNumber(
                        colorText: isActive == 3 ? Colors.black : Colors.white,
                        number: 3,
                        backgroundColor:
                            isActive == 3 ? Colors.white : Colors.black),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
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
