import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SolarTextTheme {
  SolarTextTheme._(); // this avoids to instantiate this class

  static TextTheme lightTheme = TextTheme(
    // headline1: GoogleFonts.montserrat(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 30.0),
    headline2: GoogleFonts.montserrat(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 30.0),
    headline3: GoogleFonts.montserrat(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 24.0),
    headline4: GoogleFonts.montserrat(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 20.0),
    //subtitle1: GoogleFonts.poppins(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 18.0),
    subtitle2: GoogleFonts.poppins(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 16.0),

  );

  static TextTheme darkTheme = TextTheme(
    headline2: GoogleFonts.montserrat(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 30.0),
    // headline1: GoogleFonts.montserrat(color: Colors.white70),
    // headline3: GoogleFonts.montserrat(color: Colors.white70),
    // headline4: GoogleFonts.montserrat(color: Colors.white70),
    subtitle1: GoogleFonts.poppins(color: Colors.white60, fontSize: 18.0),
    subtitle2: GoogleFonts.poppins(color: Colors.white60, fontSize: 16.0),


  );
}
