import 'package:flutter/material.dart';

class BmrUi extends StatefulWidget {
  const BmrUi({super.key});

  @override
  State<BmrUi> createState() => _BmrUiState();
}

class _BmrUiState extends State<BmrUi> {
  TextEditingController ageCtrl = TextEditingController();
  TextEditingController heightCtrl = TextEditingController();
  TextEditingController weightCtrl = TextEditingController();

  double bmrValue = 0;
  String gender = 'male';

  void calculateBMR() {
    if (ageCtrl.text.isEmpty ||
        heightCtrl.text.isEmpty ||
        weightCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('กรุณากรอกข้อมูลให้ครบถ้วน!'),
            backgroundColor: Colors.red),
      );
      return;
    }

    double weight = double.parse(weightCtrl.text);
    double height = double.parse(heightCtrl.text);
    double age = double.parse(ageCtrl.text);

    setState(() {
      if (gender == 'male') {
        // สำหรับผู้ชาย
        bmrValue = 66 + (13.7 * weight) + (5 * height) - (6.8 * age);
      } else {
        // สำหรับผู้หญิง
        bmrValue = 665 + (9.6 * weight) + (1.8 * height) - (4.7 * age);
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('คำนวณ BMR สำเร็จ!'), backgroundColor: Colors.green),
      );
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
                  'คำนวณหาค่า BMR',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]),
                ),
                const SizedBox(height: 30),
                Image.asset(
                  'assets/images/bmr.png',
                  width: 160,
                  height: 160,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.bolt,
                      size: 160,
                      color: Color(0xffE4E882)),
                ),
                const SizedBox(height: 30),

                // เลือกเพศ
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                        value: 'male',
                        groupValue: gender,
                        onChanged: (value) =>
                            setState(() => gender = value.toString())),
                    const Text('ชาย'),
                    const SizedBox(width: 20),
                    Radio(
                        value: 'female',
                        groupValue: gender,
                        onChanged: (value) =>
                            setState(() => gender = value.toString())),
                    const Text('หญิง'),
                  ],
                ),

                const SizedBox(height: 20),
                _buildTextField(ageCtrl, 'อายุ (ปี)', 'กรอกอายุของคุณ'),
                const SizedBox(height: 20),
                _buildTextField(
                    weightCtrl, 'น้ำหนัก (kg.)', 'กรอกน้ำหนักของคุณ'),
                const SizedBox(height: 20),
                _buildTextField(
                    heightCtrl, 'ส่วนสูง (cm.)', 'กรอกส่วนสูงของคุณ'),

                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: calculateBMR,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffE4E882),
                    foregroundColor: Colors.white,
                    fixedSize: Size(MediaQuery.of(context).size.width, 55.0),
                  ),
                  child: const Text('คำนวณ BMR',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () => setState(() {
                    ageCtrl.clear();
                    weightCtrl.clear();
                    heightCtrl.clear();
                    bmrValue = 0;
                  }),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[400],
                    foregroundColor: Colors.white,
                    fixedSize: Size(MediaQuery.of(context).size.width, 55.0),
                  ),
                  child: const Text('ล้างข้อมูล',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                ),

                const SizedBox(height: 30),
                // ส่วนแสดงผล
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      const Text('BMR (พลังงานที่ใช้พื้นฐาน)',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(
                        bmrValue.toStringAsFixed(2),
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[800]),
                      ),
                      const Text('กิโลแคลอรี่ / วัน'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController ctrl, String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 10),
        TextField(
          controller: ctrl,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: hint,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          ),
        ),
      ],
    );
  }
}
