import 'package:application_social/features/home/presentation/screens/widgets/home_widget.dart';
import 'package:flutter/material.dart';

class CategoryName extends StatelessWidget {
  final String category;
  const CategoryName({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(category, style: mainWord,),
        TextButton(
            onPressed: () {},
            child: const Text('View all',
                style: TextStyle(
                  
                  decoration: TextDecoration.underline,
                )))
      ],
    );
  }
}
