import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static final Color blackWithOpacity = Colors.black.withOpacity(0.4);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: <Widget>[
          Container(
            color: const Color(0xFFEFEEEC),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: screenHeight * 0.9,
              width: screenWidth,
              decoration: BoxDecoration(
                color: const Color(0xFF322C39),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(80),
                ),
                boxShadow: [
                  BoxShadow(
                    color: blackWithOpacity,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.14),
                    Image.asset(
                      'assets/evolt-logo.png',
                      width: 276,
                      height: 276,
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: screenWidth * 0.71,
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'Username',
                          filled: true,
                          fillColor: Color(0xFF322C39),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(
                              width: 3.0,
                              color: Color(0xFFC92C6C),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(
                              width: 2,
                              color: Color(0xFF609FA1),
                            ),
                          ),
                          hintStyle: TextStyle(color: Color(0xFFEFEEEC)),
                        ),
                        style: TextStyle(color: Color(0xFFEFEEEC)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: screenWidth * 0.71,
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'Password',
                          filled: true,
                          fillColor: Color(0xFF322C39),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(
                              width: 3,
                              color: Color(0xFFC92C6C),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(
                              width: 2,
                              color: Color(0xFF609FA1),
                            ),
                          ),
                          hintStyle: TextStyle(color: Color(0xFFEFEEEC)),
                        ),
                        style: TextStyle(color: Color(0xFFEFEEEC)),
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: screenWidth * 0.37,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(16)),
                          backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF609FA1)),
                          shadowColor: MaterialStateProperty.all<Color>(Colors.black.withOpacity(0.8)),
                          elevation: MaterialStateProperty.all(5),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/home');
                        },
                        child: const Text(
                          'Masuk',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
