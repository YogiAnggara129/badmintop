import 'package:flutter/material.dart';

Color blueColorFirst = const Color(0xFF4CB8C4);
Color blueColorSecond = const Color(0xFF3CD3AD);
Color blueColorThird = const Color(0xFF1BA087);
Color itemColor = const Color(0xFF626262);

TextStyle h1HeaderStyle = const TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 32,
);

TextStyle h2HeaderStyle = const TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.normal,
  fontSize: 24,
);

TextStyle h3HeaderStyle = const TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.normal,
  fontSize: 15,
);

TextStyle h1ItemStyle = TextStyle(
  color: blueColorThird,
  fontWeight: FontWeight.bold,
  fontSize: 18,
);

TextStyle h2ItemStyle = TextStyle(
  color: blueColorThird,
  fontWeight: FontWeight.bold,
  fontSize: 16,
);

TextStyle itemContentStyle = TextStyle(
  color: itemColor,
  fontWeight: FontWeight.normal,
  fontSize: 15,
);

BoxDecoration lineItemStyle = const BoxDecoration(
  border: Border(
    bottom: BorderSide(
      width: 1.0
    )
  )
);