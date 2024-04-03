import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              color: Color(0xFF322C39),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(2, 4),
                  spreadRadius: 3,
                )
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  left: -216,
                  top: -346,
                  child: Container(
                    width: 791,
                    height: 689,
                    decoration: const ShapeDecoration(
                      color: Color(0xFFEFEEEC),
                      shape: OvalBorder(),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  left: 70,
                  top: 130,
                  child: Text(
                    'HELLO, ',
                    style: TextStyle(
                      color: Color(0xFF322C39),
                      fontSize: 48,
                      fontFamily: 'Microsoft Yi Baiti',
                      fontWeight: FontWeight.normal,
                      height: 1.0,
                    ),
                  ),
                ),
                const Positioned(
                  left: 190,
                  top: 193,
                  child: Text(
                    '{Name}',
                    style: TextStyle(
                      color: Color(0xFF322C39),
                      fontSize: 48,
                      fontFamily: 'Microsoft Yi Baiti',
                      fontWeight: FontWeight.normal,
                      height: 1.0,
                    ),
                  ),
                ),
                const Positioned(
                  left: 130,
                  top: 391,
                  child: Text(
                    'Slide to unlock door!',
                    style: TextStyle(
                      color: Color(0xFFEFEEEC),
                      fontSize: 14,
                      fontFamily: 'Microsoft Yahei UI',
                      fontWeight: FontWeight.w400,
                      height: 1.0,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
