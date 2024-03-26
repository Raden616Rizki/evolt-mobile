import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              color: const Color(0xFFEFEEEC),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: screenHeight * 0.85,
                width: screenWidth,
                decoration: BoxDecoration(
                  color: const Color(0xFF322C39),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(80),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.8),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/evolt-logo.png',
                      width: 276,
                      height: 276,
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
