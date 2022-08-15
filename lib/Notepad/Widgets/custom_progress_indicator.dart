import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomProgressIndicator extends StatelessWidget {
  ///var
  String? textMessage;

  ///const
  CustomProgressIndicator({
    Key? key,
    this.textMessage,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                textMessage ?? "text message",
                textAlign: TextAlign.center,
                style: GoogleFonts.salsa(
                  textStyle: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12.5),
            const Center(
              child: LinearProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}
