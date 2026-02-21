import 'package:flutter/material.dart';
import 'package:flutter_body_health_calculator_app/view/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(Flutter_Body_Healt_Calculator_App());
}

class Flutter_Body_Healt_Calculator_App extends StatefulWidget {
  const Flutter_Body_Healt_Calculator_App({super.key});

  @override
  State<Flutter_Body_Healt_Calculator_App> createState() =>
      _Flutter_Body_Healt_Calculator_AppState();
}

class _Flutter_Body_Healt_Calculator_AppState
    extends State<Flutter_Body_Healt_Calculator_App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreenUi(),
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ));
  }
}
