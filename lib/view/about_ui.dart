import 'package:flutter/material.dart';

class AboutUi extends StatefulWidget {
  const AboutUi({super.key});

  @override
  State<AboutUi> createState() => _AboutUiState();
}

class _AboutUiState extends State<AboutUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Body Health Calculator',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/images/calculator.png',
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                const Text(
                  'คำนวณหาค่าดัชนีมวลกาย (BMI)',
                ),
                const SizedBox(height: 10),
                const Text(
                  'คำนวณหาค่าแคลอรี่ที่ร่างกายต้องการในแต่ละวัน (BMR)',
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Logosau-02.png/330px-Logosau-02.png',
                  width: 50,
                  height: 50,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image),
                ),
                const SizedBox(height: 10),
                Text(
                  'Developed by Bepaosts',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
