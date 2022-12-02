import 'package:application_social/core/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      
      onChanged: (value) => context.read<Login>().changeLogin(value),
      // controller: myController,
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
