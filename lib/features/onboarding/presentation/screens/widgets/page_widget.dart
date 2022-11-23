import 'package:application_social/features/onboarding/presentation/screens/widgets/page_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardWidget extends StatelessWidget {
  final String onboardingLogo;

  final String onboardingImage;
  const OnBoardWidget({
    Key? key,
    required this.onboardingLogo,
    required this.onboardingImage,
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
              'assets/images/$onboardingLogo',
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
                  children: const [
                    PageNumber(
                        colorText: Colors.black,
                        number: 0,
                        backgroundColor: Colors.white),
                    PageNumber(
                        colorText: Colors.white,
                        number: 2,
                        backgroundColor: Colors.black),
                    PageNumber(
                        colorText: Colors.white,
                        number: 3,
                        backgroundColor: Colors.black),
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
