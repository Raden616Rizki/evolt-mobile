import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF322C39),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        children: [
          UserPageContent(),
        ],
      ),
    );
  }
}

class UserPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          width: screenWidth,
          height: screenHeight * 1.5,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Color(0xFF322C39)),
          child: Stack(
            children: [
              Positioned(
                left: screenWidth * 0.075,
                top: screenHeight * 0.22,
                child: SizedBox(
                  width: screenWidth * 0.85,
                  height: screenHeight,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: screenWidth * 0.85,
                          height: screenHeight * 0.12,
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
                                fontSize: 20,
                                fontFamily: 'Leelawadee UI',
                                fontWeight: FontWeight.w500,
                                height: 1.2,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: screenHeight * 0.1,
                        child: Container(
                          width: screenWidth * 0.85,
                          height: screenHeight * 0.35,
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
                        left: screenWidth * 0.04,
                        top: screenHeight * 0.14,
                        child: Container(
                          width: screenWidth * 0.75,
                          height: screenHeight * 0.04,
                          child: Stack(
                            children: [
                              Positioned(
                                left: screenWidth * 0.21,
                                top: 0,
                                child: Container(
                                  width: screenWidth * 0.53,
                                  height: screenHeight * 0.04,
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
                                  width: screenWidth * 0.2,
                                  height: screenHeight * 0.04,
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
                                        fontSize: 11,
                                        fontFamily: 'Microsoft YaHei UI',
                                        fontWeight: FontWeight.w600,
                                        height: 1.2,
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
                        left: screenWidth * 0.04,
                        top: screenHeight * 0.21,
                        child: Container(
                          width: screenWidth * 0.75,
                          height: screenHeight * 0.04,
                          child: Stack(
                            children: [
                              Positioned(
                                left: screenWidth * 0.21,
                                top: 0,
                                child: Container(
                                  width: screenWidth * 0.53,
                                  height: screenHeight * 0.04,
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
                                  width: screenWidth * 0.2,
                                  height: screenHeight * 0.04,
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
                                        fontSize: 11,
                                        fontFamily: 'Microsoft YaHei UI',
                                        fontWeight: FontWeight.w600,
                                        height: 1.2,
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
                        left: screenWidth * 0.04,
                        top: screenHeight * 0.28,
                        child: Container(
                          width: screenWidth * 0.75,
                          height: screenHeight * 0.04,
                          child: Stack(
                            children: [
                              Positioned(
                                left: screenWidth * 0.21,
                                top: 0,
                                child: Container(
                                  width: screenWidth * 0.53,
                                  height: screenHeight * 0.04,
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
                                  width: screenWidth * 0.2,
                                  height: screenHeight * 0.04,
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
                                        fontSize: 11,
                                        fontFamily: 'Microsoft YaHei UI',
                                        fontWeight: FontWeight.w600,
                                        height: 1.2,
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
                left: screenWidth * 0.3,
                top: screenHeight * 0.60,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: Container(
                    width: screenWidth * 0.4,
                    height: screenHeight * 0.05,
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
                          height: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: screenWidth * 0.380,
                top: screenHeight * 0.565,
                child: const Text(
                  'Change information?',
                  style: TextStyle(
                    color: Color(0xFF648FFF),
                    fontSize: 10,
                    fontFamily: 'Microsoft YaHei UI',
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                  ),
                ),
              ),
              Positioned(
                left: screenWidth * 0.365,
                top: screenHeight * 0.12,
                child: Container(
                  width: screenWidth * 0.28,
                  height: screenHeight * 0.14,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Icon-Profile.png'),
                      fit: BoxFit.cover,
                    ),
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
