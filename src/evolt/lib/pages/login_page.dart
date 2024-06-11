import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  static final Color blackWithOpacity = Colors.black.withOpacity(0.4);

  Future<void> login(String username, String pin) async {
    if (username.isEmpty || pin.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Input Error'),
            content: const Text('Username and pin cannot be empty.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    final response = await http.post(
      Uri.parse('http://34.101.227.125:8000/api/login/mobile'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'pin': pin,
      }),
    );

    if (response.statusCode == 200) {
      // debugPrint('Login successful');
      final responseData = jsonDecode(response.body);
      final user = responseData['user'];
      final doors = responseData['doors'];
      // debugPrint('Response data: $user');
      Navigator.of(context)
          .pushNamed('/home', arguments: {'users': user, 'doors': doors});
    } else {
      debugPrint('Login failed with status: ${response.statusCode}.');
      debugPrint('Response body: ${response.body}');
      final responseData = jsonDecode(response.body);
      debugPrint('Error message: ${responseData['message']}');
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Login Failed'),
            content:
                Text(responseData['message'] ?? 'Invalid username or pin.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> testConnection() async {
    try {
      final response = await http.get(Uri.parse('http://34.101.227.125:8000'));
      if (response.statusCode == 200) {
        debugPrint('Connection successful');
      } else {
        debugPrint('Failed to connect with status: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    testConnection();
  }

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
                      child: TextField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
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
                        style: const TextStyle(color: Color(0xFFEFEEEC)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: screenWidth * 0.71,
                      child: TextField(
                        controller: _pinController,
                        decoration: const InputDecoration(
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
                        style: const TextStyle(color: Color(0xFFEFEEEC)),
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: screenWidth * 0.37,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.all(16)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFF609FA1)),
                          shadowColor: MaterialStateProperty.all<Color>(
                              Colors.black.withOpacity(0.8)),
                          elevation: MaterialStateProperty.all(5),
                        ),
                        onPressed: () {
                          final username = _usernameController.text;
                          final pin = _pinController.text;
                          login(username, pin);
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
