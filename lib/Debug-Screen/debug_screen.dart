import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DebugScreen extends StatelessWidget {
  const DebugScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Debug Mode'.toUpperCase(),
              textAlign: TextAlign.center,
              style: GoogleFonts.salsa(
                textStyle: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotatedBox(
                quarterTurns: 3,
                child: Center(
                  child: Text(
                    'Debug Mode'.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.salsa(
                      textStyle: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),
              ),
              Center(child: Image.asset("assets/debug_mode.png")),
              RotatedBox(
                quarterTurns: 1,
                child: Center(
                  child: Text(
                    'Debug Mode'.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.salsa(
                      textStyle: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Text(
              'Debug Mode'.toUpperCase(),
              textAlign: TextAlign.center,
              style: GoogleFonts.salsa(
                textStyle: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
