import 'package:application_social/features/onboarding/presentation/screens/widgets/page_widget.dart';
import 'package:flutter/material.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final controller = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: [
        OnBoardWidget(
          onboardingImage: "210.svg",
          isActive: 1,
          text: 'Фонд поддержки стартапов "Спутник"',
        ),
        OnBoardWidget(
            onboardingImage: "39.svg",
            isActive: 2,
            text:
                'Мы помогаем сфокусироваться на главном - предпринимательстве'),
        OnBoardWidget(
          onboardingImage: "125.svg",
          isActive: 3,
          text: 'Сделано ботаниками для ботаников',
          heightSizeBox: 60,
        ),
      ],
    );
  }
}
