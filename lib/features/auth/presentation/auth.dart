import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final myController = TextEditingController();
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Github social',
                  softWrap: true,
                  style: GoogleFonts.poppins(
                    textStyle: (const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w700)),
                  )),
              Text('Enter nickname on github',
                  softWrap: true,
                  style: GoogleFonts.poppins(
                    textStyle: (TextStyle(
                        color: Colors.grey[700],
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
                  )),
              const SizedBox(
                height: 40,
              ),
              TextField(
                controller: myController,
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.all(25),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  filled: true,
                  fillColor: Color.fromRGBO(240, 240, 240, 1),
                  labelText: 'Nickname',
                  hintText: 'Enter nickname',
                  hintStyle: TextStyle(fontSize: 38),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                ),
              ),
              const SizedBox(height: 200),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: myController.text.isEmpty
                    ? null
                    : () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Auth(),
                            ));
                      },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                    minimumSize: const Size(double.infinity, 60)),
                child: const Text(
                  'Search',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('By signin in, I agree with'),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Terms of Use'),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('and'),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Privacy Policy'),
                  )
                ],
              )
            ]),
      ),
    );
  }
}
