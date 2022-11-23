import 'package:application_social/features/onboarding/presentation/screens/widgets/page_widget.dart';
import 'package:flutter/material.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PageController(
      initialPage: 0,
      keepPage: true,
    );
    return PageView(
      controller: controller,
      children: const [
        OnBoardWidget(onboardingImage: "210.svg", onboardingLogo: "010.svg"),
        OnBoardWidget(onboardingImage: "39.svg", onboardingLogo: "010.svg"),
        OnBoardWidget(onboardingImage: "125.svg", onboardingLogo: "010.svg"),
      ],
    );
  }
}
