import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color blueColorFirst = const Color(0xFF4CB8C4);
Color blueColorSecond = const Color(0xFF3CD3AD);

TextStyle h1HeaderStyle = GoogleFonts.roboto(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 32,
);

TextStyle h2HeaderStyle = GoogleFonts.roboto(
  color: Colors.white,
  fontWeight: FontWeight.normal,
  fontSize: 24,
);

TextStyle h1ItemStyle = GoogleFonts.roboto(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 16,
);

TextStyle itemContentStyle = GoogleFonts.roboto(
  color: Colors.black,
  fontWeight: FontWeight.normal,
  fontSize: 16,
);

BoxDecoration lineItemStyle = BoxDecoration(
  border: Border(
    bottom: BorderSide(
      width: 1.0
    )
  )
);

BoxDecoration cardStyle = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.all(Radius.circular(20.0)),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      blurRadius: 4,
      offset: Offset(0, 4), // changes position of shadow
    ),
  ],
);