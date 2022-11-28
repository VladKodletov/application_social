import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final String nameButton;
  final IconData iconPrefix;
  final Color colorIcon;
  const ProfileButton({
    Key? key,
    required this.nameButton,
    required this.iconPrefix,
    required this.colorIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            child: Row(
              children: [
                Icon(
                  iconPrefix,
                  color: colorIcon,
                ),
                Text(
                  nameButton,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        )
      ],
    );
  }
}
