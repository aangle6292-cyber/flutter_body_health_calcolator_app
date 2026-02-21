import 'package:flutter/material.dart';
import 'package:flutter_body_health_calculator_app/view/about_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bmi_ui.dart';
import 'bmr_ui.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  List<Widget> ShowBody = [BmiUi(), AboutUi(), BmrUi()];
  int currentIndexStatus = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffE4E882),
        title: const Text(
          'Body Health Calculator',
          style: TextStyle(color: Color(0xffEDEBEB)),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentIndexStatus = value;
          });
        },
        currentIndex: currentIndexStatus,
        selectedItemColor: const Color(0xffE4E882),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.calculator),
            label: 'BMI',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.house),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.check),
            label: 'BMR',
          ),
        ],
      ),
      body: ShowBody[currentIndexStatus],
    );
  }
}
