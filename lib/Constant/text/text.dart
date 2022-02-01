import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

//single line text widget:
Widget sText(String title, Color color, double size, FontWeight weight) {
  return Text(
    title,
    style:
        GoogleFonts.quicksand(color: color, fontSize: size, fontWeight: weight),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}

Widget sText2(String title, Color color, double size, FontWeight weight) {
  return Text(
    title,
    style:
    GoogleFonts.quicksand(color: color, fontSize: size, fontWeight: weight),
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
  );
}
//multiline line text widget:
Widget mText(String title, Color color, double size, FontWeight weight) {
  return Text(
    title,
    style:
        GoogleFonts.quicksand(color: color, fontSize: size, fontWeight: weight),
  );
}

Widget mText1(
    List<String> title1, Color color, double size, FontWeight weight) {
  String title = "";
  for (int i = 0; i < title1.length; i++) {
    title += title1[i];
  }

  return Text(
    title,
    style:
        GoogleFonts.quicksand(color: color, fontSize: size, fontWeight: weight),
  );
}

//rich line text widget(f=first text, s=second tex)

Widget rText(String ftitle, String stitle, Color fcolor, Color scolor,
    double size, FontWeight weight) {
  return RichText(
    text: TextSpan(
        text: ftitle,
        style: GoogleFonts.quicksand(
            color: fcolor, fontSize: size, fontWeight: weight),
        children: <TextSpan>[
          TextSpan(
            text: stitle,
            style: GoogleFonts.quicksand(
                color: scolor, fontSize: size, fontWeight: weight),
          ),
        ]),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}
