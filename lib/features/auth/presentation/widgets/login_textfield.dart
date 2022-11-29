import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    Key? key,
    required this.myController,
  }) : super(key: key);

  final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myController,
      style: const TextStyle(fontSize: 30),
      decoration: const InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        isDense: true,
        contentPadding: EdgeInsets.all(25),
        filled: true,
        fillColor: Color.fromRGBO(240, 240, 240, 1),
        labelText: 'Nickname',
        labelStyle: TextStyle(fontSize: 24, color: Colors.grey),
        hintText: 'Enter nickname',
        hintStyle: TextStyle(fontSize: 24),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(12))),
      ),
    );
  }
}