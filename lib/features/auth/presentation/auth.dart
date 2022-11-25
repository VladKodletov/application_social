import 'package:application_social/features/home/presentation/screens/homepage.dart';
import 'package:application_social/features/home/presentation/screens/widgets/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

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
    // myController.addListener(response);
    super.initState();
  }

  _buttonState() {
    setState(() {
      myController.text;
    });
  }

  response() async {
    String nameLogin = myController.text;
    Uri uri = Uri.parse('https://api.github.com/users/$nameLogin');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      setState(() {
        myController.text;
        showError = false;
      });
    }
    {
      setState(() {
        showError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
              showError == false
                  ? const SizedBox(
                      height: 350,
                    )
                  : SizedBox(
                      height: 350,
                      child: Text(
                        "Нет такого ника!",
                        style: TextStyle(fontSize: 46),
                      ),
                    ),
              ElevatedButton(
                onPressed: myController.text.isEmpty
                    ? null
                    : () {
                        response();
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                          // TODO first variant
                          // builder: (context) => const HomePage(),
                          // TODO second variant
                        //       builder: (myController.text) => const HomePage(myController.text),
                        //     ));
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
