import 'package:flutter/material.dart';

void main() {
  runApp(const UserPage());
}

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          UserPageContent(),
        ]),
      ),
    );
  }
}

class UserPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 360,
          height: 800,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Color(0xFF322C39)),
          child: Stack(
            children: [
              Positioned(
                left: 27,
                top: 155,
                child: Container(
                  width: 305,
                  height: 276,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 305,
                          height: 81,
                          decoration: const ShapeDecoration(
                            color: Color(0xFF609FA1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'USER INFORMATION',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Leelawadee UI',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 48,
                        child: Container(
                          width: 305,
                          height: 228,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFEFEEEC),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 15,
                        top: 62,
                        child: Container(
                          width: 275,
                          height: 24,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 78,
                                top: 0,
                                child: Container(
                                  width: 197,
                                  height: 24,
                                  decoration: const ShapeDecoration(
                                    color: Color(0xFF609FA1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(40),
                                        bottomLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(40),
                                      ),
                                    ),
                                    shadows: [
                                      BoxShadow(
                                        color: Color(0x3F000000),
                                        blurRadius: 4,
                                        offset: Offset(2, 5),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 73,
                                  height: 24,
                                  decoration: const ShapeDecoration(
                                    color: Color(0xFF609FA1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(40),
                                        topRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(40),
                                        bottomRight: Radius.circular(5),
                                      ),
                                    ),
                                    shadows: [
                                      BoxShadow(
                                        color: Color(0x3F000000),
                                        blurRadius: 4,
                                        offset: Offset(2, 5),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'EMAIL',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontFamily: 'Microsoft YaHei UI',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 15,
                        top: 100,
                        child: Container(
                          width: 275,
                          height: 24,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 78,
                                top: 0,
                                child: Container(
                                  width: 197,
                                  height: 24,
                                  decoration: const ShapeDecoration(
                                    color: Color(0xFF609FA1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(40),
                                        bottomLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(40),
                                      ),
                                    ),
                                    shadows: [
                                      BoxShadow(
                                        color: Color(0x3F000000),
                                        blurRadius: 4,
                                        offset: Offset(2, 5),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 73,
                                  height: 24,
                                  decoration: const ShapeDecoration(
                                    color: Color(0xFF609FA1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(40),
                                        topRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(40),
                                        bottomRight: Radius.circular(5),
                                      ),
                                    ),
                                    shadows: [
                                      BoxShadow(
                                        color: Color(0x3F000000),
                                        blurRadius: 4,
                                        offset: Offset(2, 5),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'USERNAME',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontFamily: 'Microsoft YaHei UI',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 15,
                        top: 138,
                        child: Container(
                          width: 275,
                          height: 24,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 78,
                                top: 0,
                                child: Container(
                                  width: 197,
                                  height: 24,
                                  decoration: const ShapeDecoration(
                                    color: Color(0xFF609FA1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(40),
                                        bottomLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(40),
                                      ),
                                    ),
                                    shadows: [
                                      BoxShadow(
                                        color: Color(0x3F000000),
                                        blurRadius: 4,
                                        offset: Offset(2, 5),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 73,
                                  height: 24,
                                  decoration: const ShapeDecoration(
                                    color: Color(0xFF609FA1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(40),
                                        topRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(40),
                                        bottomRight: Radius.circular(5),
                                      ),
                                    ),
                                    shadows: [
                                      BoxShadow(
                                        color: Color(0x3F000000),
                                        blurRadius: 4,
                                        offset: Offset(2, 5),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'STATUS',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontFamily: 'Microsoft YaHei UI',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 105,
                top: 452,
                child: Container(
                  width: 149,
                  height: 42,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFC92C6C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'LOGOUT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Microsoft YaHei UI',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 134,
                top: 397,
                child: Text(
                  'Change information?',
                  style: TextStyle(
                    color: Color(0xFF648FFF),
                    fontSize: 9,
                    fontFamily: 'Microsoft YaHei UI',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Positioned(
                left: 120,
                top: 76,
                child: Container(
                  width: 110,
                  height: 110,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 14,
                        top: 0,
                        child: Container(
                          width: 96,
                          height: 96,
                          decoration: const ShapeDecoration(
                            color: Color(0xFF322C39),
                            shape: CircleBorder(),
                          ),
                          child: Center(
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                image: AssetImage('assets/Icon Profile.png'),
                                fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

