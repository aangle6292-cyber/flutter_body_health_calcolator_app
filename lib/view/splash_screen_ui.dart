import 'package:flutter/material.dart';

import 'home_ui.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeUi(),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE0DA38),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/calculator.png',
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.width * 0.45,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Body Health Calculator',
                    style: TextStyle(
                        color: Color(0xffE0DA38),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  CircularProgressIndicator(
                    color: Color(0xffE0DA38),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.10),
        ],
      ),
    );
  }
}
