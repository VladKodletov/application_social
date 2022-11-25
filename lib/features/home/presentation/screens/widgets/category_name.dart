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
        Text(category),
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
