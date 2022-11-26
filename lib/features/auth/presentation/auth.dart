import 'package:application_social/core/service/models/user_model.dart';
import 'package:application_social/features/home/presentation/screens/homepage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final myController = TextEditingController();

  bool showError = false;
  String nameLogin = '';

  @override
  void initState() {
    myController.addListener(_buttonState);
    super.initState();
  }

  _buttonState() {
    setState(() {
      myController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text('GitHub social',
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                  )),
              Text('Enter nickname on github',
                  softWrap: true,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  )),
              const SizedBox(
                height: 40,
              ),
              TextField(
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
              ),
              if (!isKeyboard) showError == false
                  ? const SizedBox(
                      height: 350,
                    )
                  : SizedBox(
                      height: 350,
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/icon1.svg',
                                fit: BoxFit.contain),
                            const Text(
                              "User with this nickname not found!",
                              style: TextStyle(fontSize: 30, color: Colors.red),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
              ElevatedButton(
                onPressed: myController.text.isEmpty
                    ? null
                    : () async {
                        try {
                          nameLogin = myController.text;
                          Uri uri = Uri.parse(
                              'https://api.github.com/users/$nameLogin');
                          final response = await http.get(uri);

                          Map<String, dynamic> data = jsonDecode(response.body);
                          // ignore: unused_local_variable
                          User user = User.fromMap(data);

                          // ignore: use_build_context_synchronously
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    HomePage(userName: nameLogin),
                              ));
                        } catch (error) {
                          setState(() {
                            showError = true;
                          });
                        }
                      },
                style: ElevatedButton.styleFrom(
                    disabledBackgroundColor: Colors.grey,
                    minimumSize: const Size(double.infinity, 60)),
                child: const Text(
                  'Search',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'By signin in, I agree with ',
                      style: TextStyle(color: Colors.black38),
                    ),
                    GestureDetector(
                      child: const Text(
                        'Terms of Use',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'and ',
                    style: TextStyle(color: Colors.black38),
                  ),
                  GestureDetector(
                    child: const Text(
                      ' Privacy Policy',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                    onTap: () {},
                  ),
                ],
              )
            ]),
      ),
    );
  }
}

class Login extends ChangeNotifier {
  void pressButton() {
    TextEditingController();
    notifyListeners();
  }
}
