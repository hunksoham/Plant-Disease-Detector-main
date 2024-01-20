import 'package:flutter/material.dart';
import 'package:plant_disease_detector/constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class TextProperty extends StatelessWidget {
  const TextProperty(
      {Key? key,
      required this.title,
      required this.value,
      required this.height})
      : super(key: key);

  final String title;
  final double height;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            title: Text(
              title,
              style: GoogleFonts.lobster(
                color: kSecondary,
                wordSpacing: 1.5,
                fontSize: (0.039 * height),
              ),
            ),
            subtitle: Text(
              value,
              style: GoogleFonts.lobster(
                color: kSecondary,
               letterSpacing: 2.5,
                fontSize: (0.026 * height),
              ),
            ),
          )
        ],
      ),
    );
  }
}
