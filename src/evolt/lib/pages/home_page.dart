import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
                  left: 60,
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
                  left: 180,
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
                Positioned(
                  left: 47,
                  top: 420,
                  child: SizedBox(
                    width: 292,
                    height: 64,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 292,
                            height: 64,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFEFEEEC),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 28,
                          top: 6,
                          child: Container(
                            width: 259,
                            height: 52,
                            decoration: const ShapeDecoration(
                              color: Color(0xFF609FA1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(50),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(50),
                                ),
                              ),
                              shadows: [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 4,
                                  offset: Offset(2, 4),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 7,
                          top: 6,
                          child: SizedBox(
                            width: 52,
                            height: 52,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: 52,
                                    height: 52,
                                    decoration: const ShapeDecoration(
                                      color: Color(0xFFC92C6C),
                                      shape: OvalBorder(),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 11.98,
                                  top: 11.66,
                                  child: Container(
                                    width: 28.36,
                                    height: 28.36,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(),
                                    child: const Stack(
                                      children: [],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 151,
                          top: 23,
                          child: Text(
                            'DOOR 1',
                            style: TextStyle(
                              color: Color(0xFFEFEEEC),
                              fontSize: 14,
                              fontFamily: 'Microsoft YaHei UI',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 47,
                  top: 500,
                  child: SizedBox(
                    width: 292,
                    height: 64,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 292,
                            height: 64,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFEFEEEC),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 28,
                          top: 6,
                          child: Container(
                            width: 259,
                            height: 52,
                            decoration: const ShapeDecoration(
                              color: Color(0xFF609FA1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(50),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(50),
                                ),
                              ),
                              shadows: [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 4,
                                  offset: Offset(2, 4),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 7,
                          top: 6,
                          child: SizedBox(
                            width: 52,
                            height: 52,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: 52,
                                    height: 52,
                                    decoration: const ShapeDecoration(
                                      color: Color(0xFFC92C6C),
                                      shape: OvalBorder(),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 11.98,
                                  top: 11.98,
                                  child: Container(
                                    width: 28.36,
                                    height: 28.36,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(),
                                    child: const Stack(
                                      children: [],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 151,
                          top: 23,
                          child: Text(
                            'DOOR 2',
                            style: TextStyle(
                              color: Color(0xFFEFEEEC),
                              fontSize: 14,
                              fontFamily: 'Microsoft YaHei UI',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 47,
                  top: 580,
                  child: SizedBox(
                    width: 292,
                    height: 64,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 292,
                            height: 64,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFEFEEEC),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 28,
                          top: 6,
                          child: Container(
                            width: 259,
                            height: 52,
                            decoration: const ShapeDecoration(
                              color: Color(0xFF609FA1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(50),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(50),
                                ),
                              ),
                              shadows: [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 4,
                                  offset: Offset(2, 4),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 7,
                          top: 6,
                          child: SizedBox(
                            width: 52,
                            height: 52,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: 52,
                                    height: 52,
                                    decoration: const ShapeDecoration(
                                      color: Color(0xFFC92C6C),
                                      shape: OvalBorder(),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 11.98,
                                  top: 11.98,
                                  child: Container(
                                    width: 28.36,
                                    height: 28.36,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(),
                                    child: const Stack(
                                      children: [],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 151,
                          top: 23,
                          child: Text(
                            'DOOR 3',
                            style: TextStyle(
                              color: Color(0xFFEFEEEC),
                              fontSize: 14,
                              fontFamily: 'Microsoft YaHei UI',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
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
