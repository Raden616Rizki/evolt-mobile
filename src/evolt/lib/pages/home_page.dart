import 'dart:ui';
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

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final Map data;
  int idUser = 0;
  String username = 'User';
  String email = 'email@gmail.com';
  String role = 'Reguler User';
  List doorsList = [];

  final MQTTService mqttService = MQTTService();
  int idPintu = 1;
  String namaPintu = '';

  late AnimationController controller;
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
        Uri.parse('http://34.101.39.34:8000/api/log/mobile'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'id_user': idUser.toString(),
          'id_pintu': idPintu.toString(),
        }),
      );
      debugPrint(response.statusCode.toString());

      await Future.delayed(const Duration(seconds: 1));
      controller.forward(from: 0.0);
      controller.addListener(() {
        setState(() {
          dragExtent = lerpDouble(dragExtent, 0.0, controller.value)!;
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration:
          Duration(seconds: 2), // This is the total duration for the animation
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        // Now it's safe to use context.
        setState(() {
          data = ModalRoute.of(context)!.settings.arguments as Map;
          // debugPrint(data.toString());
          idUser = data['users']["id_user"];
          username = data['users']["username"];
          email = data['users']["email"];
          role = data['users']["role"]["role_name"];
          debugPrint(role);
          doorsList = data['doors'];
          idPintu = doorsList[0]['id_door'];
          namaPintu = doorsList[0]['door_name'];
        });
        mqttService.connect(idUser);
      }
    });
  }

  @override
  void dispose() {
    // Don't forget to dispose of the controller when the widget is removed
    controller.dispose();
    super.dispose();
  }

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
              Navigator.of(context).pushNamed('/user', arguments: {
                'email': email,
                'username': username,
                'role': role
              });
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
                    left: screenWidth * 0.33,
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
                        width: screenWidth,
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
                  Positioned(
                    // Positioned DropUpButton
                    left: screenWidth * 0.32,
                    bottom: screenHeight * 0.05,
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
}
