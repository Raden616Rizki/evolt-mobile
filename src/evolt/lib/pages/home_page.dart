// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:evolt/services/mqtt_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final Map data;
  int idUser = 0;
  String username = 'User';
  List doorsList = [];

  final MQTTService mqttService = MQTTService();
  int idPintu = 1;
  String namaPintu = '';

  double dragExtent = 0.0;

  void onDragUpdate(DragUpdateDetails details) {
    setState(() {
      dragExtent += details.primaryDelta!;
      dragExtent =
          dragExtent.clamp(0.0, MediaQuery.of(context).size.width * 0.6);
    });
  }

  void onDragEnd(DragEndDetails details) async {
    if (dragExtent >= MediaQuery.of(context).size.width * 0.6) {
      // Perform your action here
      // debugPrint('Door unlocked!');
      mqttService.publish("lock/control/$idPintu", "UNLOCK");

      final response = await http.post(
        Uri.parse('http://34.101.227.125:8000/api/log/mobile'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'id_user': idUser.toString(),
          'id_pintu': idPintu.toString(),
        }),
      );
      debugPrint(response.statusCode.toString());
    }

    setState(() {
      dragExtent = 0.0;
    });
  }

  @override
  void initState() {
    super.initState();
    // getListPintu();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        // Now it's safe to use context.
        setState(() {
          data = ModalRoute.of(context)!.settings.arguments as Map;
          // debugPrint(data.toString());
          idUser = data['users']["id_user"];
          username = data['users']["username"];
          doorsList = data['doors'];
          idPintu = doorsList[0]['id_door'];
          namaPintu = doorsList[0]['door_name'];
        });
        mqttService.connect(idUser);
      }
    });
  }

  double myWidth = 0;
  double translateX = 0.0;
  double translateY = 0.0;

  final int shortDuration = 200; // Duration for quick swipe right
  final int longDuration = 500; // Duration for slow swipe back

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    // debugPrint(doorsList.toString());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFEFEEEC),
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Image.asset('assets/Icon User.png'),
            iconSize: 40.0,
            onPressed: () {
              Navigator.of(context).pushNamed('/user');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: screenWidth,
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
                  Positioned(
                    left: 60,
                    top: screenHeight * 0.1,
                    child: const Text(
                      'Selamat \n Datang,  ',
                      style: TextStyle(
                        color: Color(0xFF322C39),
                        fontSize: 48,
                        fontFamily: 'Microsoft Yi Baiti',
                        fontWeight: FontWeight.bold,
                        height: 1.0,
                      ),
                    ),
                  ),
                  // ElevatedButton(
                  //   onPressed: () =>
                  //       mqttService.publish("lock/control/$idPintu", "UNLOCK"),
                  //   child: const Text('Unlock'),
                  // ),
                  Positioned(
                    left: 180,
                    top: screenHeight * 0.23,
                    child: Text(
                      username,
                      style: const TextStyle(
                        color: Color(0xFF322C39),
                        fontSize: 48,
                        fontFamily: 'Microsoft Yi Baiti',
                        fontWeight: FontWeight.normal,
                        height: 1.0,
                      ),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.348,
                    top: screenHeight * 0.72,
                    child: const Text(
                      'Swipe to unlock door!',
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
                    left: screenWidth * 0.1,
                    right: screenWidth * 0.1,
                    bottom: screenHeight * 0.21,
                    child: GestureDetector(
                      onHorizontalDragUpdate: onDragUpdate,
                      onHorizontalDragEnd: onDragEnd,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: dragExtent),
                        decoration: BoxDecoration(
                          color: const Color(0xFF609FA1), // Background color
                          border: Border.all(
                            color: const Color(0xFFEFEEEC), // Border color
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          width: 80,
                          height: 60,
                          decoration: BoxDecoration(
                            color: const Color(0xFFC92C6C), // Button color
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFFEFEEEC), // Icon color
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Positioned(
                  //   left: 60.0,
                  //   top: screenHeight * 0.6,
                  //   width: 282.0,
                  //   height: 64.0,
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(50.0),
                  //       color: Colors.white,
                  //     ),
                  //     child: Stack(
                  //       children: [
                  //         Positioned.fill(
                  //           child: Padding(
                  //             padding: const EdgeInsets.all(4.0),
                  //             child: Container(
                  //               decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(50.0),
                  //                 color: const Color(0xFFF070A4),
                  //               ),
                  //               child: GestureDetector(
                  //                 onHorizontalDragUpdate: (event) async {
                  //                   if (event.primaryDelta! > 10) {
                  //                     _incTransXval();
                  //                   } else if (event.primaryDelta! < -10) {
                  //                     _decTransXval();
                  //                   }
                  //                 },
                  //                 onHorizontalDragEnd: (event) async {
                  //                   setState(() {
                  //                     if (translateX >=
                  //                         MediaQuery.of(context).size.width /
                  //                             2) {
                  //                       translateX =
                  //                           MediaQuery.of(context).size.width -
                  //                               100;
                  //                       myWidth =
                  //                           MediaQuery.of(context).size.width -
                  //                               100;
                  //                       mqttService.publish(
                  //                           "lock/control/$idPintu", "UNLOCK");
                  //                     } else {
                  //                       translateX = 0.0;
                  //                       myWidth = 0.0;
                  //                     }
                  //                   });
                  //                   await Future.delayed(const Duration(
                  //                       seconds: 1)); // delay for 1 second
                  //                   setState(() {
                  //                     translateX = 0.0;
                  //                     myWidth = 0.0;
                  //                   });
                  //                 },
                  //                 child: Row(
                  //                   mainAxisAlignment:
                  //                       MainAxisAlignment.spaceBetween,
                  //                   children: [
                  //                     unlockSuccessfull(),
                  //                     myWidth == 0.0
                  //                         ? const Expanded(
                  //                             child: Center(
                  //                               child: Text(
                  //                                 "",
                  //                                 style: TextStyle(
                  //                                   color: Colors.white,
                  //                                   fontSize: 17.0,
                  //                                 ),
                  //                               ),
                  //                             ),
                  //                           )
                  //                         : const SizedBox(),
                  //                   ],
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Positioned(
                    // Positioned DropUpButton
                    left: 145,
                    bottom: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF322C39),
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: DropdownButton<int>(
                            value: idPintu,
                            icon: const Icon(Icons.arrow_drop_up,
                                color: Colors.white),
                            dropdownColor: const Color(0xFF322C39),
                            style: const TextStyle(color: Colors.white),
                            underline: Container(),
                            items: doorsList.map((doorList) {
                              return DropdownMenuItem<int>(
                                value: doorList['id_door'],
                                child: Text(
                                  doorList['door_name'],
                                  style: const TextStyle(color: Colors.white),
                                ),
                              );
                            }).toList(),
                            onChanged: (int? newValue) {
                              setState(() {
                                idPintu = newValue!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget unlockSuccessfull() => Transform.translate(
  //       offset: Offset(translateX, translateY),
  //       child: AnimatedContainer(
  //         duration: translateX == 0
  //             ? Duration(milliseconds: longDuration)
  //             : Duration(
  //                 milliseconds:
  //                     shortDuration), // Different durations for swipe right and back
  //         width: 70 + myWidth,
  //         height: 64, // Match the height of the container
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(50.0),
  //           color: const Color(0xFFC92C6C),
  //         ),
  //         child: myWidth > 0.0
  //             ? const Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Icon(
  //                     Icons.check,
  //                     color: Colors.white,
  //                     size: 30,
  //                   ),
  //                   SizedBox(width: 5), // Space between icon and text
  //                   Flexible(
  //                     child: Text(
  //                       "Door Opened",
  //                       style: TextStyle(color: Colors.white, fontSize: 19.0),
  //                     ),
  //                   )
  //                 ],
  //               )
  //             : const Icon(
  //                 Icons.navigate_next,
  //                 color: Colors.white,
  //                 size: 50.0,
  //               ),
  //       ),
  //     );

  // _incTransXval() async {
  //   int canLoop = -1;
  //   for (var i = 0; canLoop == -1; i++) {
  //     setState(() {
  //       if (translateX + 1 <
  //           MediaQuery.of(context).size.width - (209 + myWidth)) {
  //         translateX += 1;
  //         myWidth = MediaQuery.of(context).size.width - (209 + myWidth);
  //       } else {
  //         setState(() {
  //           canLoop = 1;
  //         });
  //       }
  //     });
  //   }
  // }

  // _decTransXval() async {
  //   int canLoop = -1;
  //   for (var i = 0; canLoop == -1; i++) {
  //     setState(() {
  //       if (translateX - 1 > 0) {
  //         translateX -= 1;
  //         myWidth = MediaQuery.of(context).size.width - (209 + myWidth);
  //       } else {
  //         setState(() {
  //           canLoop = 1;
  //         });
  //       }
  //     });
  //   }
  // }
}
