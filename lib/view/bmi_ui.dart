import 'package:flutter/material.dart';
import 'dart:math';

class BmiUi extends StatefulWidget {
  const BmiUi({super.key});

  @override
  State<BmiUi> createState() => _BmiUiState();
}

class _BmiUiState extends State<BmiUi> {
  TextEditingController hctrl = TextEditingController();
  TextEditingController wctrl = TextEditingController();
  double bmivalue = 0;

  void calculateBMI() {
    if (wctrl.text.isEmpty || hctrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('กรุณากรอกข้อมูลให้ครบถ้วน!'),
          backgroundColor: Color(0xffFA0A00),
        ),
      );
      return;
    }

    setState(() {
      double weight = double.parse(wctrl.text);
      double height = double.parse(hctrl.text) / 100;

      bmivalue = weight / pow(height, 2);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'คำนวณสำเร็จ! ค่า BMI ของคุณคือ ${bmivalue.toStringAsFixed(2)}'),
          backgroundColor: Colors.green,
        ),
      );
    });
  }

  void clearAll() {
    setState(() {
      wctrl.clear();
      hctrl.clear();
      bmivalue = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Text(
                  'คำนวณหาค่าดัชนีมวลกาย (BMI)',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 30),
                Image.asset(
                  'assets/images/bmi.png',
                  width: 160,
                  height: 160,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.fitness_center, size: 160),
                ),
                const SizedBox(height: 30),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('น้ำหนัก (kg.)'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: wctrl,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'กรอกน้ำหนักของคุณ',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  ),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('ส่วนสูง (cm.)'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: hctrl,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'กรอกส่วนสูงของคุณ',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: calculateBMI,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffE4E882),
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(fontSize: 18),
                    fixedSize: Size(MediaQuery.of(context).size.width, 55.0),
                  ),
                  child: const Text(
                    'คำนวณ BMI',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: clearAll,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[400],
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(fontSize: 18),
                    fixedSize: Size(MediaQuery.of(context).size.width, 55.0),
                  ),
                  child: const Text(
                    'ล้างข้อมูล',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'BMI',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        Text(
                          bmivalue.toStringAsFixed(2),
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffE4E882),
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
      ),
    );
  }
}
